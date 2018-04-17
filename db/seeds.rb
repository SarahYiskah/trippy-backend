# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# new itinerary
Itinerary.create(name: 'nyc')
user = User.create(name: 'sarah', email: 'sarah@email.com', password: 'hello')

#UserIntinerary
brooke = UserItinerary.create(user_id: 1, itinerary_id: 1)

#new activity
starbucks = Activity.create(name: 'Starbucks', url: 'starbucks.com', formatted_address: 'Broadway 11', longitude: 0.0, latitude: 0.0)

#join
sarah = ItineraryActivity.create(activity_id: 1, itinerary_id:1)
        UserActivity.create(user_id: 1, activity_id: 1)

#new review
Review.create(content: 'hii', user_id: 1, activity_id: 1)
Review.create(content: 'hii', user_id: 2, activity_id: 1)
Review.create(content: 'hii', user_id: 3, activity_id: 1)
Review.create(content: 'hii', user_id: 4, activity_id: 1)
Review.create(content: 'hii', user_id: 5, activity_id: 1)
Review.create(content: 'hii', user_id: 6, activity_id: 1)
Review.create(content: 'hii', user_id: 7, activity_id: 1)
Review.create(content: 'hii', user_id: 8, activity_id: 1)
Review.create(content: 'hii', user_id: 9, activity_id: 1)
Review.create(content: 'hii', user_id: 10, activity_id: 1)
Review.create(content: 'hii', user_id: 11, activity_id: 1)
Review.create(content: 'hii', user_id: 12, activity_id: 1)
Review.create(content: 'hii', user_id: 13, activity_id: 1)
Review.create(content: 'hii', user_id: 14, activity_id: 1)
Review.create(content: 'hii', user_id: 15, activity_id: 1)
Review.create(content: 'hii', user_id: 16, activity_id: 1)
Review.create(content: 'hii', user_id: 17, activity_id: 1)
Review.create(content: 'hii', user_id: 18, activity_id: 1)
Review.create(content: 'hii', user_id: 19, activity_id: 1)
Review.create(content: 'hii', user_id: 20, activity_id: 1)


User.first.itineraries
