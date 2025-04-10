class ParticipantPointsController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def show
    @my_gifts = PointsLog.where(competition_id: params[:competition_id], gifter: params[:participant])
    @my_rewards = PointsLog.select("date(date_awarded) as date_awarded, sum(points_awarded) as amount,count(gifter) as gifters")
                           .where(competition_id: params[:competition_id], receiver: params[:participant]).group('date_awarded')

    
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private
end
