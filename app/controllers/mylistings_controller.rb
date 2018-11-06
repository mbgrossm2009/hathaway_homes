class MylistingsController < ApplicationController
    def index
      @mylistings = Mylisting.all
      if params[:search]
        @mylistings = Mylisting.search(params[:search]).order("created_at DESC")
      else
        @mylistings = Mylisting.all.order('created_at DESC')
      end
    end

    def create
      @mylisting = Mylisting.new(mylisting_params)
       if @mylisting.save
        flash[:alert] = "New Listing Added Successfully"
        redirect_to mylistings_path
      else
        render :new
      end
    end

    def destroy
      @mylisting = Mylisting.find(params[:id])
      @mylisting.destroy
      flash[:alert] = "Listing has been deleted"
      redirect_to mylistings_path
    end

    def new
      @mylisting = Mylisting.new
    end

    def show
      @mylisting = Mylisting.find(params[:id])
    end

    def edit
      @mylisting = Mylisting.find(params[:id])
    end

    def update
    @mylisting = Mylisting.find(params[:id])
      if @mylisting.update_attributes(mylisting_params) && current_user == @mylisting.user
        flash[:alert] = "Listing Successfully Updated"
        redirect_to mylistings_path
      else
        render 'edit'
      end
    end

  private

    def mylisting_params
      params.require(:mylisting).permit(:house_style, :street_address, :state, :zipcode, :number_of_bathrooms, :number_of_bedrooms, :square_footage, :description, :asking_price,{mylisting_photo: []}, :town,:user_id)
    end
  end
