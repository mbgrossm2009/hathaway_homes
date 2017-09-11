class Listing < ApplicationRecord

  mount_uploader :listing_photo, ListingPhotoUploader
end
