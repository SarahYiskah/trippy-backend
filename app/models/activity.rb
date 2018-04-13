class Activity < ApplicationRecord
  has_many :itinerary_activities
  has_many :itineraries, through: :itinerary_activities
  has_many :reviews
  has_many :user_activities
  has_many :users, through: :user_activities
end
