class Listing < ApplicationRecord
belongs_to :user, optional: true
  mount_uploader :listing_photo, ListingPhotoUploader
end
