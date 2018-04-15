class Api::V1::UsersController < ApplicationController

  # before_action :authorize!, only: [:users_snacks]

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    # @user.name = params["name"]
    # @user.email = params["email"]
    # @user.password = params["password"]
    if @user.save
      render json: { user_token: token_for(@user) }
    else
      render json: { errors: @user.errors.full_messages }, :status => :unprocessable_entity
    end
  end

  def authorized?
    current_user_id.to_s == params[:user_id]
  end

  # def users_snacks
  #   unless authorized?
  #     render json: { take_a_hike: true}
  #   else
  #     @user = User.find_by(id: params[:user_id])
  #     if @user
  #       render json: @user.snacks
  #     else
  #       render json: true, :status => :not_found
  #     end
  #   end
  # end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
