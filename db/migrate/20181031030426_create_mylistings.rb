class CreateMylistings < ActiveRecord::Migration[5.1]
  def change
    create_table :mylistings do |t|
          t.string :house_style
          t.string :street_address
          t.string :state
          t.string :zipcode
          t.string :number_of_bathrooms
          t.string :number_of_bedrooms
          t.string :square_footage
          t.string :asking_price
          t.string :town
          t.integer :user_id
          t.text :description
          t.string :mylisting_photo, default: [], array: true



          t.timestamps
        end
      end
    end
