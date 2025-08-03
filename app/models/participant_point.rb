# frozen_string_literal: true

class ParticipantPoint < ApplicationRecord # rubocop:disable Style/Documentation
  validates :person_id, :competition_id, presence: true

  belongs_to :person
  belongs_to :competition

  WEEKLY_POINTS = 25
  CONTROL_START_DATE = Date.parse('1 August, 2025') # Remove for future competitions
  CONTROL_END_DATE = Date.parse('8 August, 2025') # Remove for future competitions
  EDGE_POINTS = 100 # Already awarded before feature
  MONTHS_SINCE_START = ((Date.today - CONTROL_START_DATE).to_i / 30.44).floor
  # Public API

  def week_number(date = Date.today)
    if date.day < 8
      1
    elsif date.day < 15
      2
    elsif date.day < 22
      3
    else
      4
    end
  end

  def points_active_duration(date = Date.today)
    # returns the a dictionary
    week = week_number
    first_of_month = date.beginning_of_month

    start_offset = (week - 1) * 7
    start_date   = first_of_month + start_offset

    end_offset = week * 7

    end_date   = week < 4 ? first_of_month + end_offset : (date + 1.month).beginning_of_month
    puts("DATES: #{start_date} - #{end_date}")
    { start_date: start_date, end_date: end_date }
  end

  def resets_on(date = Date.today)
    points_active_duration(date)[:end_date]
  end

  def frozen_points
    # total participation points accumulated after control start date
    # - points used in point log
    months_since_control_start = ((Date.today - CONTROL_START_DATE).to_i / 30.44).floor # replace with comp created_on
    puts("MONTHS: #{months_since_control_start}")
    accumulated_points = ((((months_since_control_start * 4) + week_number) - 1) * WEEKLY_POINTS) + EDGE_POINTS
    awarded_points = PointsLog
                     .where(
                       gifter: person_id,
                       competition_id: competition_id,
                       date_awarded: ..(points_active_duration[:start_date])
                     )
                     .sum(:points_awarded)
    puts("Accumulated points: #{accumulated_points}, Awarded points: #{awarded_points}")
    if Date.today < CONTROL_END_DATE
      0
    else
      accumulated_points - awarded_points
    end
  end

  def active_points(date = Date.today) # rubocop:disable Metrics/MethodLength
    awarded = PointsLog
              .where(
                competition_id: competition_id,
                gifter: person_id,
                date_awarded: points_active_duration[:start_date]..points_active_duration[:end_date]
              )
              .sum(:points_awarded)
    if date < CONTROL_END_DATE
      (WEEKLY_POINTS + EDGE_POINTS) - awarded
    else
      WEEKLY_POINTS - awarded
    end
  end

  def pending_points
    # return active_points -  if Date.today < edge_points_active_date
    # total_points - (accummulated points)
    accummulated_points = (((MONTHS_SINCE_START * 4) + week_number) * WEEKLY_POINTS) + EDGE_POINTS
    ParticipantPoint.where(
      person_id: person_id,
      competition_id: competition_id
    ).pluck(:total_points).first - accummulated_points
  end
end
