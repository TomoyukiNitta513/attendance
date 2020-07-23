# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Department.create!(
  name: "department1")

Rank .create!(
  rank: "1")

User.create!(name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  department_id: 1,
  rank_id: 1,
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    department_id: 1,
    rank_id: 1,
    activated: true,
    activated_at: Time.zone.now)
end

20.times do |n|
  id = "#{n+1}"
  from = Date.parse("2020/08/01")
  to = Date.parse("2020/08/31")
  date = Random.rand(from..to)
  AttendanceManagement.create!(
    user_id: id,
    attendance_date: date,
    sch_attendance: "2020/01/01/08:00:00"
    sch_leaving: "2020/01/01/16:00:00"
  )
