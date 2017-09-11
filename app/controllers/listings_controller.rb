class ListingsController < ApplicationController

  def index

  @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create

    @listing = Listing.new(listing_params)

    if @listing.save
      flash[:alert] = "New Listing Added Successfully"
      redirect_to listings_path

    else
      flash[:alert]= @listing.errors.full_messages
      render :new
  end
end

private

def listing_params
    params.require(:listing).permit(:house_style, :street_address, :state, :zipcode, :number_of_bathrooms, :number_of_bedrooms, :number_of_acres, :asking_price)
  end
end
