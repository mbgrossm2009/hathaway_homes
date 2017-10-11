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

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:alert] = "Review has been deleted"
    redirect_to reviews_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
      if @review.update_attributes(review_params) && current_user == @review.user
      flash[:alert] = "Review Successfully Updated"
      redirect_to reviews_path
    else
      render 'edit'
    end
  end

  def upvote
    @review = Review.find(params[:id])
    Vote.create(review: @review, user: current_user)
    redirect_to(reviews_path)
  end

  def downvote
    @review = Review.find(params[:id])
    Downvote.create(review: @review, user: current_user)
    redirect_to(reviews_path)
  end



  private

  def review_params
  params.require(:review).permit(:description, :user_id)
  end
end
