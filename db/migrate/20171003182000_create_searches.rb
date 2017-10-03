class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :house_style
      t.string :street_address
      t.string :state
      t.integer :number_of_bathrooms
      t.integer :number_of_bedrooms
      t.integer :number_of_acres
      t.integer :asking_price
      t.string :town
      t.string :zipcode

      t.timestamps
    end
  end
end
