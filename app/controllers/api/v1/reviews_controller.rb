class Api::V1::ReviewsController < ApplicationController

  skip_before_action :authenticate!, only: [:index]

  def index
    @reviews = Review.all
    @user = user.find(id: params[:user_id])
    @filt_reviews = @reviews.select{|review| @user.followers.include(review.user_id)}
    render json: @filt_reviews
  end

  # def friend_reviews
  #   @reviews = Review.all
  #   @filt_reviews = @reviews.select(|review| @user.followers.include(review.user_id))
  # end

end
