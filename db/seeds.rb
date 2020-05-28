require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
occupations = ["Software Developer", "Engineer", "Doctor", "Translator", "Language Teacher", "Manager"]
gender = ["Female", "Male"]

puts "Destyoying all seeds "

Event.destroy_all
User.destroy_all
Audience.destroy_all

puts "All Destroyed ^_^"

# Users

puts "Creating users!"

User.create!(
  first_name: "Baris",
  last_name: "Unluer",
  email: "baris@baris.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Male",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Chihiro",
  last_name: "Tsuda",
  email: "chi@chi.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Female",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Grant",
  last_name: "Holley",
  email: "grant@grant.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Male",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Yun",
  last_name: "Chung",
  email: "yun@yun.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Male",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Julien",
  last_name: "Ergan",
  email: "julien@julien.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Male",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Munekatsu",
  last_name: "Furugen",
  email: "katsu@katsu.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Male",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Shogo",
  last_name: "Hida",
  email: "shogo@shogo.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Male",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Yusuke",
  last_name: "Ishida",
  email: "yusuke@yusuke.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Male",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Lukasz",
  last_name: "Koziel",
  email: "lukasz@lukasz.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Male",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Momotaro",
  last_name: "Nakamura",
  email: "momo@momo.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Male",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Pins",
  last_name: "Thoo",
  email: "pins@pins.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Female",
  occupation: occupations.sample
  )

User.create!(
  first_name: "Nicole",
  last_name: "Wong",
  email: "nicole@nicole.com",
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: "Female",
  occupation: occupations.sample
  )

100.times do
  User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "localife",
  birthday: Date.today-rand(50000),
  gender: gender.sample,
  occupation: occupations.sample
  )
end

User.all.each do |user|
  user.age = Date.today.year - user.birthday.year
  user.age -= 1 if Date.today < user.birthday + user.age.years
  user.save
end

puts "#{User.count} user created!"

# Events

puts "Creating some events!"

Event.create!(
  title: "Web Development for Beginners",
  description: "Let's create a landing page from scratch.",
  user: User.find_by(email: "baris@baris.com"),
  start_time: DateTime.now,
  end_time: DateTime.now + 1
  )

Event.create!(
  title: "Game Development with Unity",
  description: "Let's make a platformer game.",
  user: User.find_by(email: "baris@baris.com"),
  start_time: DateTime.now,
  end_time: DateTime.now + 1
  )

Event.create!(
  title: "Ruby Basics",
  description: "Learn how to code with Ruby.",
  user: User.find_by(email: "chi@chi.com"),
  start_time: DateTime.now,
  end_time: DateTime.now + 1
  )

Event.create!(
  title: "Your first game with Ruby",
  description: "Make a snake clone using Gosu Game Engine and coding with Ruby.",
  user: User.find_by(email: "chi@chi.com"),
  start_time: DateTime.now,
  end_time: DateTime.now + 1
  )

Event.create!(
  title: "JavaScript Animations",
  description: "Do some cool animations and transitions on your web page.",
  user: User.find_by(email: "grant@grant.com"),
  start_time: DateTime.now,
  end_time: DateTime.now + 1
  )

Event.create!(
  title: "Advanced CSS tips",
  description: "Learn how to use CSS like a pro.",
  user: User.find_by(email: "grant@grant.com"),
  start_time: DateTime.now,
  end_time: DateTime.now + 1
  )

puts "#{Event.count} events created!"

# Audiences

puts "Creating audiences!"

increment = 0

30.times do
  increment += 1
  Audience.create!(
    event: Event.find(4),
    user: User.find(1 + increment)
  )

  Audience.create!(
    event: Event.find(1),
    user: User.find(31 + increment)
  )

  Audience.create!(
    event: Event.find(5),
    user: User.find(61 + increment)
  )
end

puts "#{Audience.count} audience created!"

puts "Done!"
