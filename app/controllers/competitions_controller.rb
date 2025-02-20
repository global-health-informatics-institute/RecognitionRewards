class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def create
  end

  def new
  end

  def show
    @competition = Competition.find(params[:id])
    @ranking = @competition.pretty_ranking()
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private
end
