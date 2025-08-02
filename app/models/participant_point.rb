# frozen_string_literal: true

class ParticipantPoint < ApplicationRecord # rubocop:disable Style/Documentation
  validates :person_id, :competition_id, presence: true

  belongs_to :person
  belongs_to :competition

  WEEKLY_POINTS = 25
  CONTROL_START_DATE = Date.parse('1 August, 2025') # Remove for future competitions
  CONTROL_END_DATE = Date.parse('8 August, 2025') # Remove for future competitions
  EDGE_POINTS = 100 # Already awarded before feature

  # Public API

  def week_number(date = Date.today)
    [date.day / 7 + 1, 4].min
  end

  def active_duration(date = Date.today)
    week = week_number
    first_of_month = date.beginning_of_month

    start_offset = (week - 1) * 7
    start_date   = first_of_month + start_offset

    end_offset = week * 7

    end_date   = week < 4 ? first_of_month + end_offset : (date + 1.month).beginning_of_month
    { start_date: start_date, end_date: end_date }
  end

  def resets_on(date = Date.today)
    active_duration(date)[:end_date]
  end

  def frozen_points
    # total participation points accumulated after control start date
    # - points used in point log
    months_since_control_start = ((Date.today - CONTROL_START_DATE).to_i / 30.44).floor
    accumulated_points = (((months_since_control_start + week_number)) * WEEKLY_POINTS) + EDGE_POINTS
    awarded_points = PointsLog
                     .where(
                       gifter: person_id,
                       competition_id: competition_id,
                       date_awarded: ..Date.today
                    )
                     .sum(:points_awarded)
    puts ("Accumulated points: #{accumulated_points}, Awarded points: #{awarded_points}")
    if Date.today < CONTROL_END_DATE
      0
    else
      accumulated_points - awarded_points
    end
  end

  def pending_points
    # return active_points -  if Date.today < edge_points_active_date

    ParticipantPoint.where(person_id: person_id,
                           competition_id: competition_id).pluck(:total_points).first - (frozen_points + active_points)
  end

  def active_points(date = Date.today)
    if date < edge_points_active_date
      legacy_active_points(date)
    else
      current_active_points(date)
    end
  end

  private

  # Computes start_date and end_date of the week for any given month-based 4-week scheme
  def compute_active_duration(date)
    week = week_number(date)
    first_of_month = date.beginning_of_month

    start_offset = (week - 1) * 7
    start_date   = first_of_month + start_offset

    end_offset = week * 7

    end_date   = week < 4 ? first_of_month + end_offset : (date + 1.month).beginning_of_month
    { start_date: start_date, end_date: end_date }
  end

  # The cutoff date when legacy + edge logic ends
  def edge_points_active_date
    compute_active_duration(CONTROL_START_DATE)[:end_date] 
  end

  # Active points during legacy period: includes EDGE_POINTS
  def legacy_active_points(date)
    window = compute_active_duration(date)
    awarded = PointsLog
              .where(
                competition_id: competition_id,
                gifter: person_id,
                date_awarded: window[:start_date]..window[:end_date]
              )
              .sum(:points_awarded)

    (WEEKLY_POINTS + EDGE_POINTS) - awarded
  end

  # Active points during current period: standard WEEKLY_POINTS rule
  def current_active_points(date)
    window = compute_active_duration(date)
    awarded = PointsLog
      .where(
        competition_id: competition_id,
        gifter: person_id,
        date_awarded: edge_points_active_date..window[:end_date]
      )
      .sum(:points_awarded)

    WEEKLY_POINTS - awarded
  end
end


# POINTSLOG: #<ActiveRecord::Relation [#<ParticipantPoint participant_point_id: 354, person_id: 74, competition_id: 4, total_points: 100, points_remaining: 97, created_at: "2025-07-28 13:27:32.097182000 +0000", updated_at: "2025-07-30 14:00:13.068455000 +0000">]>
