class Competition < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def competition_summary
    rank = pretty_ranking(1)
    summary = {
      total_points: all_points_votes,
      remaining_points: remaining_points,
      leader: (rank.first.nil? ? nil : rank.first.first) ,
      leader_count: (rank.first.nil? ? 0 : rank.first.second) ,
      points_to_win: points_to_win,
      highest_gifter: highest_gifter,
      most_improved: '',
      least_active: least_active,
      most_active: most_active
    }

    return summary
  end

  def highest_gifter
    pts = PointsLog.select("gifter, sum(points_awarded) as points").where(competition_id: self.id).group(:gifter).order("points desc").first
    return "#{Person.find(pts.gifter).full_name} (#{pts.points} points)"
  end

  def most_active
    pts = PointsLog.select("gifter, count(*) as times").where(competition_id: self.id).group(:gifter).order("times desc").first
    return "#{Person.find(pts.gifter).full_name}"
  end

  def least_active
    pts = PointsLog.select("gifter, count(*) as times").where(competition_id: self.id).group(:gifter).order("times asc").first
    return "#{Person.find(pts.gifter).full_name}"
  end

  def points_to_win
    second_place = top_ranking(2).second.vote_count rescue 0
    available_points = remaining_points
    return (second_place + available_points) +1
  end
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

    [person.full_name, person.gender]

  end

  def status
    if self.end_date > Date.today
      return "Open"
    elsif self.end_date < Date.today
      return "Closed"
    end
  end
  

  def all_points_votes
    if self.competition_type == "Election"
      Participant.where("competition_id = ? ", self.id).count
    else
      ParticipantPoint.where(competition_id: self.id).sum(:total_points)
    end
  end
  
  private
  def remaining_points
    if self.competition_type == "Election"
      Participant.where("competition_id = ? and person_id not in (?)",
                        self.id, Vote.where(competition_id: self.id).pluck(:person_id)).count
    else
      ParticipantPoint.where(competition_id: self.id).sum(:points_remaining)
    end
  end
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
