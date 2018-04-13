class CreateUserItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :user_itineraries do |t|
      t.integer :user_id
      t.integer :itinerary_id
      t.timestamps
    end
  end
end
