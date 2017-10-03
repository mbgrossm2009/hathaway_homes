class SearchesController < ApplicationController

  def new
    @search= Search.new
  end


  def create
    @search = Search.create!(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

private

  def search_params
    params.require(:search).permit(:house_style, :street_address, :state, :zipcode, :number_of_bathrooms, :number_of_bedrooms, :number_of_acres, :asking_price, :town)
  end
end
