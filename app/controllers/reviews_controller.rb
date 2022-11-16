class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:index, :new, :create]

  def index
    @reviews = Review.where(@review == @restaurant)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
