class RecognitionRewardMailer < ApplicationMailer
  default from: 'communications@ghii.org'

  def welcome_email(user, password)
    @user = user
    @password = password
    @url = Rails.application.config.recognition_reward_url
    mail(
      to: @user.email_address,
      subject: 'Welcome to the Recognition Reward Platform'
    )
  end

  def reset_password_email(user, password)
    @user = user
    @password = password
    @url = Rails.application.config.recognition_reward_url
    mail(
      to: @user.email_address,
      subject: 'Reward Recognition Password Reset'
    )
  end

  def new_competition_email(user, competition)
    @user = user
    @url = Rails.application.config.recognition_reward_url
    @competition = competition
    mail(
      to: @user.email_address,
      subject: 'New Competition'
    )
  end

  def results_email(user, competition)
    @user = user
    @url = Rails.application.config.recognition_reward_url
    @competition = competition
    mail(
      to: @user.email_address,
      subject: 'Reward Recognition Competition Results'
    )
  end

  def congratulation_email(user, competition) # rubocop:disable Metrics/MethodLength
    @user = user
    @url = Rails.application.config.recognition_reward_url
    @competition = competition
    competition_points = CompetitionPoint.where(competition_id: competition.competition_id).order(points_earned: :desc)
    user_competition_point = competition_points.find_by(person_id: @user.person_id)
    @place = user_competition_point ? competition_points.index(user_competition_point) + 1 : 'N/A'
    @points = user_competition_point&.points_earned || 0
    mail(
      to: user.email_address,
      subject: 'Congratulations!!'
    )
  end

end
