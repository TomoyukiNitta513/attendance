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
    payment: "1050",
    activated: true,
    activated_at: Time.zone.now)
end

20.times do |n|
  id = "#{n+1}"
  a_date = Date.today.beginning_of_month
  4.times do
    5.times do
    AttendanceManagement.create!(
      user_id: id,
      attendance_date: a_date,
      sch_attendance: Time.parse("2000/01/01 08:00"),
      sch_leaving: Time.parse("2000/01/01 16:00"),
      res_attendance: Time.parse("2000/01/01 08:01"),
      res_break_in: Time.parse("2000/01/01 12:00"),
      res_break_out: Time.parse("2000/01/01 13:00"),
      res_leaving: Time.parse("2000/01/01 16:01")
    )
    a_date += 1
    end
    a_date += 2
  end
end

20.times do |n|
  id = "#{n+1}"
  a_date = Date.today.next_month.beginning_of_month
  4.times do
    5.times do
    AttendanceManagement.create!(
      user_id: id,
      attendance_date: a_date,
      sch_attendance: Time.parse("2000/01/01 08:00"),
      sch_leaving: Time.parse("2000/01/01 16:00")
    )
    a_date += 1
    end
    a_date += 2
  end
end
