# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

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
  user_2.skip_confirmation_notification!
  user_2.skip_confirmation!
  user_2.save!
end
