class Api::V1::UsersController < ApplicationController

  # before_action :authorize!, only: [:users_following]
  skip_before_action :authenticate!, only: [:create]

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      render json: user_json(@user)
    else
      render json: { errors: @user.errors.full_messages }, :status => :unprocessable_entity
    end
  end

  def authorized?
    current_user_id.to_s == params[:user_id]
  end

  def show
    unless authorized?
      render json: { take_a_hike: true}
    else
      @user = User.find_by(id: params[:user_id])
      if @user
        render json: @user
      else
        render json: true, :status => :not_found
      end
    end
  end

  def users_followers
    unless authorized?
      render json: { take_a_hike: true}
    else
      @user = User.find_by(id: params[:user_id])
      if @user
        render json: @user.followers
      else
        render json: true, :status => :not_found
      end
    end
  end

  def users_following
    unless authorized?
      render json: { take_a_hike: true}
    else
      @user = User.find_by(id: params[:user_id])
      if @user
        render json: @user.following
      else
        render json: true, :status => :not_found
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
