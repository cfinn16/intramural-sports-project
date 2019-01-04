# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

            # "name" "sport" "day_of_week" "cost" "level"
League.create(name: 'Tuesday Kickball', sport: 'kickball', day_of_week: 'Tuesday', cost: 200, level: 'beginner', city_id: 1)
League.create(name: 'Wednesday Kickball', sport: 'kickball', day_of_week: 'Wednesday', cost: 300, level: 'intermediate', city_id: 2)
League.create(name: 'Thursday Soccer', sport: 'soccer', day_of_week: 'Thursday', cost: 400, level: 'intermediate', city_id: 3)
League.create(name: 'Monday Soccer', sport: 'soccer', day_of_week: 'Monday', cost: 500, level: 'expert', city_id: 4)
League.create(name: 'Saturday Soccer', sport: 'soccer', day_of_week: 'Saturday', cost: 250, level: 'beginner', city_id: 5)
League.create(name: 'Wednesday Basketball', sport: 'basketball', day_of_week: 'Wednesday', cost: 200, level: 'intermediate', city_id: 6)
League.create(name: 'Sunday Basketball', sport: 'basketball', day_of_week: 'Monday', cost: 300, level: 'expert', city_id: 7)
League.create(name: 'Friday Basketball', sport: 'basketball', day_of_week: 'Saturday', cost: 100, level: 'beginner', city_id: 8)

Team.create(name: "Just For Kicks", paid: true, league_id: 1)
Team.create(name: "Pretty Good", paid: false, league_id: 2)
Team.create(name: "Here For Beer", paid: true, league_id: 3)
Team.create(name: "Number One Team", paid: false, league_id: 4)
Team.create(name: "GOATs", paid: true, league_id: 5)
Team.create(name: "Big Ballers", paid: false, league_id: 6)
Team.create(name: "Nothing But Net", paid: true, league_id: 7)
Team.create(name: "Free Throws", paid: false, league_id: 8)

City.create(name: "New York")
City.create(name: "Boston")
City.create(name: "Washington D.C.")
City.create(name: "Atlanta")
City.create(name: "Austin")
City.create(name: "San Francisco")
City.create(name: "Los Angeles")
City.create(name: "Chicago")
City.create(name: "Madison")

League.create(name: 'Monday Kickball', sport: 'kickball', day_of_week: 'Monday', cost: 200, level: 'beginner', city_id: 1)

100.times do
  day_of_week = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).sample
  sport = %w(Soccer Basketball Softball Kickball Dodgeball Volleyball Hockey Football).sample
  League.create(
    sport: sport,
    day_of_week: day_of_week,
    name: day_of_week + " " + sport,
    cost: rand(100..1000),
    level: %w(Beginner Intermediate Experienced).sample,
    city_id: rand(1..9)
  )
end

250.times do
  Team.create(
    name: Faker::Team.name,
    paid: [true, false].sample,
    league_id: rand(1..100)
  )
end

50.times do
  Team.create(
    name: Faker::Football.team,
    paid: [true, false].sample,
    league_id: rand(1..100)
  )
end

teams = Team.all.map{|t| t.id}

350.times do
  name = Faker::Name.unique.name
  Player.create(
    name: name,
    email: Faker::Internet.email(name),
    team_ids: teams.sample
  )
end

50.times do
  name = Faker::Football.player
  Player.create(
    name: name,
    email: Faker::Internet.email(name),
    team_ids: teams.sample
  )
end
