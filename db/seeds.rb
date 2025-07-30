require 'csv'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

source = "#{Rails.root}/db/data"
puts "Seeding the database with data"

puts 'Adding People'
CSV.foreach("#{source}/person.csv", headers: true) do |row|
  new_person = Person.create(
    first_name: row[0],
    last_name: row[1],
    gender: row[2].eql?('M') ? 'Male' : 'Female'
  )

  username = "#{new_person.last_name}#{new_person.first_name[0]}#{rand(999).to_s.rjust(3, '0')}"
  password = username
  new_user = User.create(
    person_id: new_person.id, 
    email_address: "#{username}@example.com",
    password: password
  )

  # Send welcome email
  RecognitionRewardMailer.welcome_email(new_user, password).deliver_later
end

people = Person.all

puts 'Adding Competitions'
competitions = ['Perfect Sidekick','The True Gem','Flocks Favorite']
(competitions || []).each do |competition|
  puts "Adding #{competition}"

  points = rand(10)*100
  new_competition = Competition.create(name: competition, competition_type: 'Contest', start_date: '2025-01-01',
                                       end_date: Date.parse('2025-01-01').advance(days: rand(182)))

  (people || []).each do |person|
    next if rand() < 0.20
    Participant.create(person_id: person.id, competition_id: new_competition.id)
    used_points = 0
    (0..rand(20)).each do
      assign_to = Person.all.sample
      awarded_points = 10*rand(5)
      date_awarded = Date.parse("2025-01-01 #{rand(23)}:#{rand(60)}:#{rand(60)}")
                         .advance(days: rand((new_competition.end_date - new_competition.start_date).to_i))
      PointsLog.create(gifter: person.id, receiver: assign_to.id, points_awarded: awarded_points, receiver: assign_to.id,
                       competition_id: new_competition.id, date_awarded: date_awarded)
      used_points += awarded_points
    end
    ParticipantPoint.create(person_id: person.id, competition_id: new_competition.id, total_points: points,
                            points_remaining: (points-used_points))
  end
end

puts 'Adding Elections'

elections = ['The MVP', 'Mover of Mountains', 'Spotlight Award', 'Conqueror of Hearts']
(elections || []).each do |election|
  puts "Adding #{election}"

  new_election = Competition.create(name: election, competition_type: 'Election', start_date: '2025-01-01',
                                    end_date: Date.parse('2025-01-01').advance(days: rand(182)))

  candidates = people.sample((rand(4)+1))
  candidate_list = []
  (candidates || []).each do |candidate|
    candidate_list.push(Candidate.create(user_id: candidate.user.id,competition_id: new_election.id))
    Participant.create(person_id: candidate.user.person_id, competition_id: new_election.id)
  end
  (people || []).each do |person|
    next if rand() < 0.15
    Participant.create(person_id: person.id, competition_id: new_election.id)
    Vote.create(competition_id: new_election.id, person_id: person.id, candidate_id: candidate_list.sample.id)
  end
end

ActiveRecord::Base.transaction do
  competition = Competition.create!(
    name: "People's Choice Award",
    start_date: Date.current,
    end_date: Date.parse('2025-12-20'),
    competition_type: 'Contest'
  )

  Person.find_each do |person|
    ParticipantPoint.create!(
      competition_id: competition.id,
      person_id: person.id,
      total_points: 100,
      points_remaining: 100
    )

    Participant.create!(
      competition_id: competition.id,
      person_id: person.id
    )
  end
end
