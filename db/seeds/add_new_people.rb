# Execute with:
# bundle exec rails runner "db/seeds/remove_old_people.rb"

require 'json'
require 'securerandom'
COMPETITION_ID = 3
TOTAL_POINTS = 600

json_data = <<~JSON
{
  "people": [
    {
      "first_name": "Aubrey",
      "last_name": "Chinkunda",
      "gender": "Male",
      "email_address": "aubreymphatso@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Chimwemwe",
      "last_name": "Tiyesi",
      "gender": "Male",
      "email_address": "chimwemwetiyesi2@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Chipiliro",
      "last_name": "Kadzakumanja",
      "gender": "Male",
      "email_address": "chiri.kadza@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Deliwe",
      "last_name": "Nkhoma",
      "gender": "Female",
      "email_address": "dbnkhoma@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Dereck",
      "last_name": "Katuli",
      "gender": "Male",
      "email_address": "katulidereck@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Dokiso",
      "last_name": "Makwakwa",
      "gender": "Male",
      "email_address": null,
      "person_id": null
    },
    {
      "first_name": "Timothy",
      "last_name": "Mtonga",
      "gender": "Male",
      "email_address": "timmtonga@gmail.com",
      "person_id": null
    },
    {
      "first_name": "John",
      "last_name": "Abudul",
      "gender": "Male",
      "email_address": "johnabudul66@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Kelvin",
      "last_name": "Msiska",
      "gender": "Male",
      "email_address": "kelvin.msiska@outlook.com",
      "person_id": null
    },
    {
      "first_name": "Kennedy",
      "last_name": "Linzie",
      "gender": "Male",
      "email_address": "Kennedylinzie@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Luke",
      "last_name": "Kamvazina",
      "gender": "Male",
      "email_address": "lmkamazina@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Mtheto",
      "last_name": "Sinjani",
      "gender": "Male",
      "email_address": "mthetosinjani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Naomi",
      "last_name": "Nyama",
      "gender": "Female",
      "email_address": "nyamanaomi38@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Neverson",
      "last_name": "Nkhata",
      "gender": "Male",
      "email_address": "nkhataneverson@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Peter",
      "last_name": "Namagonya",
      "gender": "Male",
      "email_address": "namagonyapeter@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Pistone",
      "last_name": "Sanjama",
      "gender": "Male",
      "email_address": "pistonsanjama45@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Rashid",
      "last_name": "Deula",
      "gender": "Male",
      "email_address": "deula.rashid@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Sophie",
      "last_name": "Mvula",
      "gender": "Female",
      "email_address": "ssgondwe@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Timothy",
      "last_name": "Banda",
      "gender": "Male",
      "email_address": "timobify@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Tobias",
      "last_name": "Bendabenda",
      "gender": "Male",
      "email_address": "skyezrabendabendah@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Wiza",
      "last_name": "Munthali",
      "gender": "Male",
      "email_address": "wizamunthali@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Wonderful",
      "last_name": "Lijoni",
      "gender": "Male",
      "email_address": "wonderfullijoni@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Lloyd",
      "last_name": "Kayembe",
      "gender": "Male",
      "email_address": "kayembeloyd@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Michael",
      "last_name": "Harawa",
      "gender": "Male",
      "email_address": "mgotaharawa@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Teleza",
      "last_name": "Kanthonga",
      "gender": "Female",
      "email_address": "telezakanthonga@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Yawapo",
      "last_name": "Chibaka",
      "gender": "Female",
      "email_address": "yawapochibaka@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Martha",
      "last_name": "Madziatera",
      "gender": "Female",
      "email_address": "mmadziatera@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Tamika",
      "last_name": "Mulenga",
      "gender": "Female",
      "email_address": "tamikamami98@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Rodger",
      "last_name": "Kumwanje",
      "gender": "Male",
      "email_address": "rkumwanje@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Hope",
      "last_name": "Madziakapita",
      "gender": "Male",
      "email_address": "hopemadziakapita@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Maxwell",
      "last_name": "Kapezi",
      "gender": "Male",
      "email_address": "maxwellkjr@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Cecilia",
      "last_name": "Kapalamula",
      "gender": "Female",
      "email_address": "ckapalamula20@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Oveka",
      "last_name": "Mwanza",
      "gender": "Female",
      "email_address": "oveka.jana@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Carolyn",
      "last_name": "Ngwira",
      "gender": "Female",
      "email_address": "kazadocarolyn@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Dominic",
      "last_name": "Mapanje",
      "gender": "Male",
      "email_address": "mapanjedominic@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Cletia",
      "last_name": "Nsambo",
      "gender": "Female",
      "email_address": "cletiansambo@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Titani",
      "last_name": "Manda",
      "gender": "Male",
      "email_address": "manda.titani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Phoebe",
      "last_name": "Khagame",
      "gender": "Female",
      "email_address": "phoebe.khagame@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Victor",
      "last_name": "Mzembe",
      "gender": "Male",
      "email_address": "winnermzembe@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Janet",
      "last_name": "Douglas",
      "gender": "Female",
      "email_address": "janetdouglas003@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Lekodi",
      "last_name": "Magombo",
      "gender": "Male",
      "email_address": "lekodimagombo@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Neo",
      "last_name": "Kazembe",
      "gender": "Female",
      "email_address": "neo.kazembe1@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Rosert",
      "last_name": "Malikebu",
      "gender": "Female",
      "email_address": "rosert.malikebu@yahoo.com",
      "person_id": null
    },
    {
      "first_name": "William",
      "last_name": "Chonzie",
      "gender": "Male",
      "email_address": "chonziewilliam@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Thokozani",
      "last_name": "Chirombo",
      "gender": "Male",
      "email_address": "tlchirombo@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Doreen",
      "last_name": "Thotho",
      "gender": "Female",
      "email_address": "doreenthotho17@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Benjamin",
      "last_name": "Munyenyembe",
      "gender": "Male",
      "email_address": "munyenyembe.benjaminc5@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Richard",
      "last_name": "Kachipapa",
      "gender": "Male",
      "email_address": "kachipaparichard@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Frank",
      "last_name": "Gondwe",
      "gender": "Male",
      "email_address": "franksgondwe@yahoo.com",
      "person_id": null
    },
    {
      "first_name": "Yamikani",
      "last_name": "Sita",
      "gender": "Male",
      "email_address": "sitayamikani@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Jones",
      "last_name": "Blackwell",
      "gender": "Male",
      "email_address": "blackwelljonesc@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Moses",
      "last_name": "Gwaza",
      "gender": "Male",
      "email_address": "mosesgwaza123@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Tamandani",
      "last_name": "Whayo",
      "gender": "Female",
      "email_address": "tamandaniwhayo@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Blessings",
      "last_name": "Kamanga",
      "gender": "Male",
      "email_address": "blessnkamanga@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Bryan",
      "last_name": "Malunje",
      "gender": "Male",
      "email_address": "malunjebryan@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Ruth",
      "last_name": "Chirwa",
      "gender": "Female",
      "email_address": "chirwaruth647@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Asante",
      "last_name": "Chisa",
      "gender": "Female",
      "email_address": "asantechisa@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Ephraim",
      "last_name": "Mandala",
      "gender": "Male",
      "email_address": "khalauheniephraim@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Shadreck",
      "last_name": "Khamba",
      "gender": "Male",
      "email_address": "shadreckkhamba3@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Paul",
      "last_name": "Martin",
      "gender": "Male",
      "email_address": "martinpaulmp104@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Kelvin",
      "last_name": "Sande",
      "gender": "Male",
      "email_address": "kelvinsande9@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Mabuchi",
      "last_name": "Nyirenda",
      "gender": "Male",
      "email_address": "mabuchi.mn@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Ruth",
      "last_name": "Msinkhu",
      "gender": "Female",
      "email_address": "ruthmsinkhu3@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Jane",
      "last_name": "Mabaso",
      "gender": "Female",
      "email_address": "janemabaso21@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Emmanuel",
      "last_name": "Mtegha",
      "gender": "Male",
      "email_address": "emmanuelmtegha7@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Waliko",
      "last_name": "Kondowe",
      "gender": "Male",
      "email_address": "walikokondowe12@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Rodgers",
      "last_name": "Mkandawire",
      "gender": "Male",
      "email_address": "rodgerswelbay@yahoo.com",
      "person_id": null
    },
    {
      "first_name": "Esther",
      "last_name": "Phanga",
      "gender": "Female",
      "email_address": "estherphanga@yahoo.com",
      "person_id": null
    },
    {
      "first_name": "Emmanuel",
      "last_name": "Mapemba",
      "gender": "Male",
      "email_address": "emmanuelmapembo3@gmail.com",
      "person_id": null
    },
    {
      "first_name": "Chipiliro",
      "last_name": "Chemkupa",
      "gender": "Female",
      "email_address": "romezi-cchemkupa@mubas.ac.mw",
      "person_id": null
    },
    {
      "first_name": "Maxwell",
      "last_name": "Kaponda",
      "gender": "Male",
      "email_address": "bbmezi-mkaponda@mubas.ac.mw",
      "person_id": null
    },
    {
      "first_name": "Matilda",
      "last_name": "Zulu",
      "gender": "Female",
      "email_address": "matilda_zulu@yahoo.com",
      "person_id": null
    },
    {
      "first_name": "Naomi",
      "last_name": "Admasu",
      "gender": "Female",
      "email_address": "nadmasu09@gmail.com",
      "person_id": null
    }
  ]
}
JSON

data = JSON.parse(json_data)

data['people'].each do |person_attrs| # rubocop:disable Metrics/BlockLength
  first_name = person_attrs['first_name']
  last_name = person_attrs['last_name']
  gender = person_attrs['gender']
  email = person_attrs['email_address']

  # Check if person already exists
  person = Person.find_by(first_name: first_name, last_name: last_name)
  user = User.find_by(email_address: email) if email.present?
  if person || user || email.nil?
    puts "Skipping existing person: #{first_name} #{last_name}"
    puts "Skipping existing user: #{email}" if user
    next
  end

  # Create Person
  person = Person.new(
    first_name: first_name,
    last_name: last_name,
    gender: gender
  )
  if person.save
    puts "Created person: #{begin
      person.full_name
    rescue StandardError
      "#{first_name} #{last_name}"
    end}"

    person_id = person.id

    # create User
    password = SecureRandom.alphanumeric(6)
    user = User.new(
      person_id: person_id,
      email_address: email,
      password: password
    )

    if user.save
      puts "Created user: #{email} with password: #{password}"
      # RecognitionRewardMailer.welcome_email(user, password).deliver_now
      puts "Sent welcome email to: #{email}"

      Participant.find_or_create_by!(
        competition_id: COMPETITION_ID,
        person_id: person_id
      )

      ParticipantPoint.find_or_create_by!(
        person_id: person_id,
        competition_id: COMPETITION_ID,
        total_points: TOTAL_POINTS,
        points_remaining: TOTAL_POINTS
      )
    else
      puts "Failed to create user: #{email}. Errors: #{user.errors.full_messages.join(',')}"
    end

  else
    puts "Failed to create person: #{begin
      person.full_name
    rescue StandardError
      "#{first_name} #{last_name}"
    end}"
    next
  end
end
require 'json'

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
  email = entry['email_address']

  # Find the person by name
  person = Person.find_by(first_name: first_name, last_name: last_name)

  unless person
    puts "Skipping, person not found: #{first_name} #{last_name}"
    next
  end

  # Check for email mismatch (if needed)
  unless person.email_address == email
    puts "Email mismatch for #{first_name} #{last_name}: expected #{email}, found #{person.email_address}"
    next
  end

  person_id = person.id

  # Destroy user(s) with same person_id and email
  User.where(person_id: person_id, email_address: email).destroy_all

  # Destroy participant in competition 3
  Participant.where(competition_id: 3, person_id: person_id).destroy_all

  puts "Removed user and participant for #{first_name} #{last_name}"
end