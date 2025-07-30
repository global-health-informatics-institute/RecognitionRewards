# bundle exec rails runner "db/seeds/remove_old_people.rb"
require 'json'
COMPETITION_ID = 4

json_data = <<-JSON
{
  "people": [
    {
      "first_name": "Angela",
      "last_name": "Chindebvu",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Beatrice",
      "last_name": "Matambo",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Blessings",
      "last_name": "Chidambe",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Boniface",
      "last_name": "Kaseka",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Elizabeth",
      "last_name": "Nthapalapa",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Emmanuel",
      "last_name": "Chauya",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Eunice",
      "last_name": "Msiska",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Evance",
      "last_name": "Mose",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Fatsani",
      "last_name": "Tamandikani",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Francis",
      "last_name": "Sambani",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Goodluck",
      "last_name": "Banda",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Grace",
      "last_name": "Bwanali",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Innocent",
      "last_name": "Kumwenda",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Israel",
      "last_name": "Ghambi",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Joseph",
      "last_name": "Sakala",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Kelvin",
      "last_name": "Saidi",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Mwabi",
      "last_name": "Lungu",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Naomi",
      "last_name": "Thompson",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Pilirani",
      "last_name": "Chikudzu",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Sharon",
      "last_name": "Ngozo",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Sithembinkosi",
      "last_name": "Phombeya",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Foster",
      "last_name": "Sentala",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Yusuf",
      "last_name": "Mtila",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Julius",
      "last_name": "Chimphampa",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Cossam",
      "last_name": "Kabaghe",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Hazel",
      "last_name": "Nanchinga",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Jane",
      "last_name": "Chaponda",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Irene",
      "last_name": "Makina",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "John",
      "last_name": "Kabambe",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Micheal",
      "last_name": "Simenti",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Phillimon",
      "last_name": "Chunga",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Willie",
      "last_name": "Kasakula",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Daphne",
      "last_name": "Magela",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Gloria",
      "last_name": "Naluso",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Hannah",
      "last_name": "Masangwi",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Steven",
      "last_name": "Kholowa",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Comfort",
      "last_name": "Mwalija",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Nigel",
      "last_name": "Banda",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Martin",
      "last_name": "Yapu",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Chipiliro",
      "last_name": "Yikwanga",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Chikonzero",
      "last_name": "Simkoza",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Janet",
      "last_name": "Chalera",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Joana",
      "last_name": "Mhone",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Ekariorama",
      "last_name": "Magaleta",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Davie",
      "last_name": "Banda",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Ethel",
      "last_name": "Utumbe",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Samuel",
      "last_name": "Chingoka",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Brenda",
      "last_name": "Luhanga",
      "gender": "Female",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    }
  ]
}
JSON

data = JSON.parse(json_data)

data['people'].each do |entry|
  first_name = entry['first_name']
  last_name = entry['last_name']

  # Find the person by name
  person = Person.find_by('TRIM(first_name) = ? AND TRIM(last_name) = ?', first_name.strip, last_name.strip)

  unless person
    puts "Skipping, person not found: #{first_name} #{last_name}"
    next
  end

  person_id = person.id

  ParticipantPoint.where(competition_id: COMPETITION_ID, person_id: person_id).destroy_all

  # Destroy participant in competition 3
  Participant.where(competition_id: COMPETITION_ID, person_id: person_id).destroy_all



  puts "Removed Participation and participant for #{first_name} #{last_name}"
end