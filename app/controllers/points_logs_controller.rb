class PointsLogsController < ApplicationController
  def index
    @open_contests = Competition.where("end_date >= ? and competition_id in (?)",
                                       Date.today,
                                       Participant.where(person_id: Current.user.person_id)
                                                  .collect{|x|x.competition_id})

  end

  def create
    
  end

  def new
    @vote = Vote.new
    @competition = Competition.find(params[:competition_id])
    @candidates = Participant.where(competition_id: @competition.id).collect { |c| [c.person.full_name, c.id] }
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
