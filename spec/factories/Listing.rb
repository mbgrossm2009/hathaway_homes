FactoryBot.define do
  factory :listing do
    street_address "8 Valley Brook Rd"
    state "MA"
    town "Westborough"
    zipcode "01581"
    square_footage "3"
    number_of_bathrooms "3"
    number_of_bedrooms "3"
    asking_price "$12000"
    user_id = 1
    zpid = 241354
    # listing_photo ("/Users/MattGrossman/desktop/hathaway-homes/hathaway_homes/spec/support/images/photo.png", "image/jpeg") }
  end
end
