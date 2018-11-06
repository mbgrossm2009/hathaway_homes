class Mylisting < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploaders :listing_photo, ListingPhotoUploader

  def self.search(search)
    where("house_style like ? OR street_address like ? OR state like ? OR town like ? ", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
