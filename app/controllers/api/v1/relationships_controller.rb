class Api::V1::RelationshipsController < ApplicationController

  def add_friend
    @user = User.find_by(id: params[:user_id])
    @friend = User.find_by(id: params[:friend_id])
    relationship = Relationship.create(follower_id: @user, followed_id: @friend)
    @user.follow(@friend)
    render json: user_json(@friend)
  end

end
