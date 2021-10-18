class FollowingsUsersController < ApplicationController
  def create
    @followings_user = FollowingsUser.new
    @followings_user.followee = User.find(params[:user_id])
    @followings_user.follower = current_user
    if @followings_user.save
      flash[:notice] = "You follow this user."
      redirect_to user_path(@followings_user.followee)
    else
      render 'show'
    end
  end

  def destroy
    @followings_user = FollowingsUser.find(params[:id])
    @followings_user.destroy
    redirect_to user_path(@followings_user.followee)
  end
end
