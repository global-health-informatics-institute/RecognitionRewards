class VotesController < ApplicationController
  def index
    @open_elections = Competition.where("start_date <= ? AND end_date >= ? and competition_type = ? ",
                                        Date.today, Date.today, 'Election').order(:start_date)
  end

  def create
    new_vote = Vote.new(competition_id: params[:competition_id], person_id: Current.user.person_id,
                candidate_id: params[:candidate])

    if new_vote.save
      @competition = new_vote.competition
      redirect_to @competition
    else
      render :new, status: :unprocessable_entity
    end

  end

  def new
    @vote = Vote.new
    @competition = Competition.find(params[:competition_id])
    @candidates = Candidate.where(competition_id: @competition.id).collect { |c| [c.user.person.full_name, c.id] }
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
  def vote_params

  end
end
