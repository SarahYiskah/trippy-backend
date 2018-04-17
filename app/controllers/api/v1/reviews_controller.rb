class Api::V1::ReviewsController < ApplicationController

  skip_before_action :authenticate!, only: [:index]

  def index
    @reviews = Review.all
    @user = User.find_by_id(params[:user_id])
    @filt_reviews = @reviews.select do |review|
      @user.following.map{|user| user.id}.include?(review.user_id)
    end

    render json: @filt_reviews, include: ['activity', 'user']
  end


end
