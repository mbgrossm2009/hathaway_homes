class ZpidsController < ApplicationController

def index
@zpids = Zpid.all
end
  def new
    @zpid = Zpid.new
  end



    def create
      @zpid = Zpid.new(zpid_params)
      if @zpid.save
        flash[:alert] = "New Listing Added Successfully"
        redirect_to listings_path
      else
        render :new
      end
    end

    private

      def zpid_params
        params.require(:zpid).permit(:zpid)
      end
end
