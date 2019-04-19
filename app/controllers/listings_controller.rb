class ListingsController < ApplicationController
before_action :load_messages
# before_action :message_params

  def index
    @zpids = Zpid.all
  end


end
