class Listing < ApplicationRecord
belongs_to :user, optional: true
mount_uploaders :listing_photo, ListingPhotoUploader

end
