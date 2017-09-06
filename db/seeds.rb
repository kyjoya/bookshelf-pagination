# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)

  # User.find_or_create_by(email: "Test@Fake.com") do |user|
  #   user.first_name = "Master"
  #   user.last_name = "Test"
  #   user.password = "password123"
  #   # user.role = "admin"
  # end

  15.times do
    user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      sign_in_count: 0
    )
    if user.valid?
      user.save!
    end
  end

  20.times do
    book = Book.new(
      title: Faker::Book.title,
      author: Faker::Book.author,
      user_id: rand(2..User.all.count),
      created_at: Faker::Time.between(2.days.ago, Time.now),
      updated_at: Faker::Time.between(1.days.ago, Time.now)
    )
    if book.valid?
      book.save!
    end
  end
