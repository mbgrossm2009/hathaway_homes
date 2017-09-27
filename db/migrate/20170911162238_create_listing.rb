class CreateListing < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :house_style
      t.string :street_address
      t.string :state
      t.string :zipcode
      t.string :number_of_bathrooms
      t.string :number_of_bedrooms
      t.integer :number_of_acres
      t.integer :asking_price
      t.string :town
      t.integer :user_id

      t.timestamps
    end
  end
end
