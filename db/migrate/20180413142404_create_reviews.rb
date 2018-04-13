class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :activity_id
      t.integer :user_id
      t.string :content

      
      t.timestamps
    end
  end
end
