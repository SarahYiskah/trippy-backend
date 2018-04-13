class CreateItineraryActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :itinerary_activities do |t|
      t.integer :itinerary_id
      t.integer :activity_id
      
      t.timestamps
    end
  end
end
