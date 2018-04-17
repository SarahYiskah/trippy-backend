class Itinerary < ApplicationRecord
  has_many :user_itineraries
  has_many :users, through: :user_itineraries
  has_many :itinerary_activities
  has_many :activities, through: :itinerary_activities
  validates :name, presence: true, uniqueness: true
end
