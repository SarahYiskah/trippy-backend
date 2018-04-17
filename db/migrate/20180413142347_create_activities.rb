class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :url
      t.string :formatted_address
      t.string :tip
      t.float :longitude
      t.float :latitude
      t.integer :user_id
      t.timestamps
    end
  end
end
