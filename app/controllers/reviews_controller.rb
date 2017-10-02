class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:alert] = "Thanks for your review!"
      redirect_to reviews_path
    else
      flash[:alert]= @review.errors.full_messages
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
