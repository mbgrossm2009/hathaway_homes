class CreateZpids < ActiveRecord::Migration[5.1]
  def change
    create_table :zpids do |t|
      t.string :zpid
      t.integer :listing_id
    end
  end
end
