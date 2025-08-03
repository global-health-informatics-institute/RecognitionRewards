class PointsLogsController < ApplicationController
  def index
    @open_contests = Competition.where('end_date >= ? and competition_id in (?)',
                                       Date.today,
                                       Participant.where(person_id: Current.user.person_id)
                                                  .collect { |x| x.competition_id })
  end

  def create # rubocop:disable Metrics/AbcSize,Metrics/MethodLength,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
    participant_point = ParticipantPoint.find_by(
      person_id: params[:gifter],
      competition_id: params[:competition_id]
    )
    if params[:candidate] == params[:gifter]
      flash[:alert] = 'Smart!! But you cannot gift yourself'
      redirect_to new_points_log_path and return
    end
    PointsLog.transaction do
      pp = ParticipantPoint.find_by_competition_id_and_person_id(params[:competition_id], Current.user.person_id)
      if participant_point.active_points < params[:points_log][:points_awarded].to_i
        flash[:alert] = "You do not have enough points to award. Balance: #{participant_point.active_points}"
        redirect_to new_points_log_path and return
      end
      if params[:points_log][:points_awarded].to_i.negative?
        flash[:alert] = 'You can not gift negative points'
        redirect_to new_points_log_path and return
      end
      if params[:points_log][:points_awarded].to_i.zero?
        flash[:alert] = 'You can not gift nothing'
        redirect_to new_points_log_path and return
      end

      PointsLog.create(competition_id: params[:competition_id], gifter: params[:gifter], receiver: params[:candidate],
                       date_awarded: DateTime.now, points_awarded: params[:points_log][:points_awarded], reason: params[:points_log][:reason])
      pp.points_remaining -= params[:points_log][:points_awarded].to_i
      pp.save
    end
    redirect_to "/competitions/#{params[:competition_id]}"
  end

  def new
    @reward = PointsLog.new
    @competition = Competition.find(params[:competition_id])
    @candidates = Participant.where(competition_id: @competition.id).collect { |c| [c.person.full_name, c.person_id] }
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
end
