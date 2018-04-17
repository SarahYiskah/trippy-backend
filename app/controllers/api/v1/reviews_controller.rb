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

  def create
    @activity = Activity.where(name: params[:content_name], user_id: params[:user_id])
    @review = Review.new(content: params[:review], user_id: params[:user_id], activity_id: @activity[0].id)
    if @review.save
      render json: @review
    else
      render json: true, :status => :not_found
    end
  end


end
