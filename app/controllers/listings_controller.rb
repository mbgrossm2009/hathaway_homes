class ListingsController < ApplicationController

  def index
    @zpids = Zpid.all
  end


end
