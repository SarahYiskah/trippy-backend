class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :category
      t.float :longitude
      t.float :latitude
      t.integer :user_id
      t.timestamps
    end
  end
end
