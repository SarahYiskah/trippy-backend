class Review < ApplicationRecord
  belongs_to :activity
  # belongs_to :itinerary_activity, through: :activity
  # belongs_to :itinerary, through: :itinerary_activity
  # belongs_to :user_itinerary, through: :itinerary
  belongs_to :user#, through: :user_itinerary
end
