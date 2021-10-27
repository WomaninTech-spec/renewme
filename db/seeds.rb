# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

if Skill.count == 0
  file = File.read('skills.json')
  data_hash = JSON.parse(file)
  data_hash["data"].each do |skill|
    Skill.create!(name: skill["name"])
  end
end
if User.where(email:"jdurant@example.com").first.nil?
  user_1 = User.new(
    first_name: "Jean",
    last_name: "Durant",
    email: "jdurant@example.com",
    username: "jdurant",
    password: "password",
    job_position: "Web developer",
    about_me: "New graduate from Le Wagon",
    role: 0,
    visible: true
  )
  url = "https://fakeface.rest/face/json?gender=male&minimum_age=35"
  response = open(url).read
  results = JSON.parse(response)
  file = URI.open(results["image_url"])
  user_1.profile_picture.attach(io:file, filename: results["filename"])
  user_1.skip_confirmation_notification!
  user_1.skip_confirmation!
  user_1.save!
end
if User.where(email:"jpaul@example.com").first.nil?
  user_1 = User.new(
    first_name: "Jean",
    last_name: "Paul",
    email: "jpaul@example.com",
    username: "jpaul",
    password: "password",
    job_position: "Web developer",
    about_me: "New graduate from Le Wagon",
    role: 0,
    visible: true
  )
  url = "https://fakeface.rest/face/json?gender=male&minimum_age=35"
  response = open(url).read
  results = JSON.parse(response)
  file = URI.open(results["image_url"])
  user_1.profile_picture.attach(io:file, filename: results["filename"])
  user_1.skip_confirmation_notification!
  user_1.skip_confirmation!
  user_1.save!
end
if User.where(email:"julie@example.com").first.nil?
  user_1 = User.new(
    first_name: "Julie",
    last_name: "Julie",
    email: "julie@example.com",
    username: "julie",
    password: "password",
    job_position: "Web developer",
    about_me: "New graduate from Le Wagon",
    role: 0,
    visible: true
  )
  url = "https://fakeface.rest/face/json?gender=female&minimum_age=35"
  response = open(url).read
  results = JSON.parse(response)
  file = URI.open(results["image_url"])
  user_1.profile_picture.attach(io:file, filename: results["filename"])
  user_1.skip_confirmation_notification!
  user_1.skip_confirmation!
  user_1.save!
end
if User.where(email:"barbara@example.com").first.nil?
  user_1 = User.new(
    first_name: "Barbara",
    last_name: "Barbara",
    email: "barbara@example.com",
    username: "barbara",
    password: "password",
    job_position: "Web developer",
    about_me: "New graduate from Le Wagon",
    role: 0,
    visible: true
  )
  url = "https://fakeface.rest/face/json?gender=female&minimum_age=35"
  response = open(url).read
  results = JSON.parse(response)
  file = URI.open(results["image_url"])
  user_1.profile_picture.attach(io:file, filename: results["filename"])
  user_1.skip_confirmation_notification!
  user_1.skip_confirmation!
  user_1.save!
end
if User.where(email:"robin@example.com").first.nil?
  user_1 = User.new(
    first_name: "Robin",
    last_name: "Robin",
    email: "robin@example.com",
    username: "robin",
    password: "password",
    job_position: "Web developer",
    about_me: "New graduate from Le Wagon",
    role: 0,
    visible: true
  )
  url = "https://fakeface.rest/face/json?gender=male&minimum_age=25"
  response = open(url).read
  results = JSON.parse(response)
  file = URI.open(results["image_url"])
  user_1.profile_picture.attach(io:file, filename: results["filename"])
  user_1.skip_confirmation_notification!
  user_1.skip_confirmation!
  user_1.save!
end
if User.where(email:"cmarchand@example.com").first.nil?
  user_2 = User.new(
    first_name: "Cecile",
    last_name: "Marchand",
    email: "cmarchand@example.com",
    username: "cmarchand",
    password: "password",
    job_position: "Project Manager",
    about_me: "New graduate from Le Wagon",
    role: 0,
    visible: true
  )
  url = "https://fakeface.rest/face/json?gender=female&minimum_age=35"
  response = open(url).read
  results = JSON.parse(response)
  file = URI.open(results["image_url"])
  user_2.profile_picture.attach(io:file, filename: results["filename"])
  user_2.skip_confirmation_notification!
  user_2.skip_confirmation!
  user_2.save!
end
if User.where(email:"chloe@example.com").first.nil?
  user_1 = User.new(
    first_name: "Chloe",
    last_name: "Chloe",
    email: "chloe@example.com",
    username: "chloe",
    password: "password",
    job_position: "Web developer",
    about_me: "New graduate from Le Wagon",
    role: 0,
    visible: true
  )
  url = "https://fakeface.rest/face/json?gender=female&minimum_age=35"
  response = open(url).read
  results = JSON.parse(response)
  file = URI.open(results["image_url"])
  user_1.profile_picture.attach(io:file, filename: results["filename"])
  user_1.skip_confirmation_notification!
  user_1.skip_confirmation!
  user_1.save!
end
if User.where(email:"mustapha@example.com").first.nil?
  user_1 = User.new(
    first_name: "Mustapha",
    last_name: "Mustapha",
    email: "mustapha@example.com",
    username: "mustapha",
    password: "password",
    job_position: "Web developer",
    about_me: "New graduate from Le Wagon",
    role: 0,
    visible: true
  )
  url = "https://fakeface.rest/face/json?gender=male&minimum_age=35"
  response = open(url).read
  results = JSON.parse(response)
  file = URI.open(results["image_url"])
  user_1.profile_picture.attach(io:file, filename: results["filename"])
  user_1.skip_confirmation_notification!
  user_1.skip_confirmation!
  user_1.save!
end
if User.where(email:"madhi@example.com").first.nil?
  user_1 = User.new(
    first_name: "Madhi",
    last_name: "Madhi",
    email: "madhi@example.com",
    username: "madhi",
    password: "password",
    job_position: "IT Recruiter",
    about_me: "Looking for good candidates",
    role: 1,
    visible: true
  )
  url = "https://fakeface.rest/face/json?gender=male&minimum_age=35"
  response = open(url).read
  results = JSON.parse(response)
  file = URI.open(results["image_url"])
  user_1.profile_picture.attach(io:file, filename: results["filename"])
  user_1.skip_confirmation_notification!
  user_1.skip_confirmation!
  user_1.save!
end


