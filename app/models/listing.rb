class Listing < ApplicationRecord
belongs_to :user, optional: true
mount_uploaders :listing_photo, ListingPhotoUploader


def self.search(query)
  where("house_style like ? OR street_address like ? OR state like ? OR town like ? ", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
end
end
