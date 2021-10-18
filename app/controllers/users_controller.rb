class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.where.not(visible: false, confirmed_at: nil, id: current_user)
  end

  def show
    @current_users_skills = UsersSkill.where(user: @user, previous_skills: false)
    @previous_users_skills = UsersSkill.where(user: @user, previous_skills: true)
    @experiences = Experience.where(user: current_user)
    @followings_user = FollowingsUser.where(followee: params[:id], follower: current_user).first
    unless @followings_user
      @followings_user = FollowingsUser.new
    end

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
