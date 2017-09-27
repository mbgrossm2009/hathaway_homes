class Listing < ApplicationRecord
belongs_to :user, optional: true
  mount_uploader :listing_photo, ListingPhotoUploader

  def self.search(search)
    where("town ILIKE ? OR zipcode ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
