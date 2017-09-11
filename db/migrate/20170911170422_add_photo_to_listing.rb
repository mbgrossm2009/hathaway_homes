class AddPhotoToListing < ActiveRecord::Migration[5.1]
  def change

    add_column :listings, :listing_photo, :string
  end
end
