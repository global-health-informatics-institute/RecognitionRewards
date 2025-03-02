class Competition < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def pretty_ranking(number=nil)
    ranks = top_ranking(number).collect{|x| [recipient(x), x.vote_count]}
    return ranks
  end
  def top_ranking(number=nil)
    if self.competition_type == "Election"
      vote_ranking(number)
    else
      competition_ranking(number)
    end
  end

  def recipient(result)
    person =  self.competition_type == "Election" ? result.candidate.user.person : Person.find(result.receiver)

    person.full_name

  end

  def status
    if self.end_date > Date.today
      return "Open"
    elsif self.end_date < Date.today
      return "Closed"
    end
  end
  private

  def competition_ranking(number=nil)
    if number.nil?
      PointsLog.select('receiver, sum(points_awarded) as vote_count')
            .where(competition_id: self.competition_id)
            .group(:receiver).order('vote_count desc')
    else
      PointsLog.select('receiver, sum(points_awarded) as vote_count')
            .where(competition_id: self.competition_id)
            .group(:receiver).order('vote_count desc').limit(number)
    end
  end
  def vote_ranking(number=nil)
    if number.nil?
      votes = Vote.select('candidate_id, count(*) as vote_count')
                 .where(competition_id: self.competition_id)
                 .group(:candidate_id).order('vote_count desc')
    else
      votes = Vote.select('candidate_id, count(*) as vote_count')
                 .where(competition_id: self.competition_id)
                 .group(:candidate_id).order('vote_count desc').limit(number)
    end
    
    return votes
  end

end
