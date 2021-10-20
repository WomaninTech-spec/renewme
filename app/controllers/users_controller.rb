class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    if params[:query] && !params[:query].empty?
      @users = User.global_search(params[:query]).where.not(visible: false, confirmed_at: nil, id: current_user)
    else
      @users = User.where.not(visible: false, confirmed_at: nil, id: current_user)
    end
  end

  def show
    @current_users_skills = UsersSkill.where(user: @user, previous_skills: false)
    @previous_users_skills = UsersSkill.where(user: @user, previous_skills: true)
    @experiences = Experience.where(user: current_user)
    @message = Message.new
    @chatroom = current_user.find_or_create_chatroom_with(@user)
    @message.chatroom = @chatroom
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
