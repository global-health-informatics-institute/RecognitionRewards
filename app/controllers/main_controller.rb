class MainController < ApplicationController

  def index
    Rails.logger.debug("CURRENT USER: #{Current.user.user_id}")
    elections = Competition.where("start_date <= ? AND end_date >= ? and competition_type = ? ",
                                  Date.today, Date.today, 'Election').order(:start_date)
    contests = Competition.where("end_date >= ? and competition_id in (?)",
                                                                Date.today,
                                                                Participant.where(person_id: Current.user.person_id)
                                                                           .collect{|x|x.competition_id})

    @current_competitions = elections + contests
    @ranks = {}
    @current_competitions.each do |competition|
      @ranks[competition.id] = {
        rank: competition.pretty_ranking(3),
        total_points: competition.all_points_votes,
      }
      @remaining_points = ParticipantPoint.where(person_id: Current.user.user_id,
                                                 competition_id: competition.id).pluck(:points_remaining).first || 0
    end
  end
end
