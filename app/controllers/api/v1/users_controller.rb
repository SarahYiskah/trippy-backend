class Api::V1::UsersController < ApplicationController

  # before_action :authorize!, only: [:users_snacks]

  def create
    @user = User.new
    @user.name = params["name"]
    @user.email = params["email"]
    @user.password = params["password"]
    if @user.save
      render json: { user_token: token_for(@user) }
    else
      render json: { errors: @user.errors.full_messages }, :status => :unprocessable_entity
    end
  end


end
