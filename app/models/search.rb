class Search < ApplicationRecord
  def listings
    @listings ||= find_listings
  end

  private

    def find_listings
       listings = Listing.all
       listings = Listing.where("house_style ILIKE ?", "%#{house_style}%") if house_style.present?
       listings = Listing.where("street_address ILIKE ?", "%#{street_address}%") if street_address.present?
       listings = Listing.where("town ILIKE ?", "%#{town}%") if town.present?
       listings = Listing.where("State ILIKE ?", "%#{state}%") if state.present?
       listings = Listing.where("zipcode ILIKE ?", "%#{zipcode}%") if zipcode.present?
       listings = Listing.where("square_footage ILIKE ?", "%#{square_footage}%") if square_footage.present?
       listings = Listing.where("number_of_bedrooms ILIKE ?", "%#{number_of_bedrooms}%") if number_of_bedrooms.present?
       listings = Listing.where("number_of_bathrooms ILIKE ?", "%#{number_of_bathrooms}%") if number_of_bathrooms.present?
       listings = Listing.where("asking_price ILIKE ?", "#{asking_price}%") if asking_price.present?
       listings
     end
   end
