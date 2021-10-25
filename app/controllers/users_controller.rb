class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    if params[:query] && !params[:query].empty?
      # if params[:query] =~ /(r|R){1}(e|E){1}(c|C){1}(r|R)?(u|U)?(i|I)?(t|T)?(e|E)?(r|R)?/
      #   @query = 1
      # elsif params[:query] =~ /(c|C){1}(a|A){1}(n|N){1}(d|D)?(i|I)?(d|D)?(a|A)?(t|T)?(e|E)?/
      #   @query = 0
      # end
      @role = SearchRole.new(params[:query])
      @search_roles = User.where(role: @role.get_role).where.not(visible: false, confirmed_at: nil, id: current_user)
      @full_search_array = @search_roles + User.global_search(params[:query]).where.not(visible: false, confirmed_at: nil, id: current_user)
      @full_search = User.where(id: @full_search_array.map(&:id))
      @pagy, @users = pagy(@full_search, items: 9)
    else
      @pagy, @users = pagy(User.where.not(visible: false, confirmed_at: nil, id: current_user), items: 9)
    end
  end

  def show
    @current_users_skills = UsersSkill.where(user: @user, previous_skills: false)
    @previous_users_skills = UsersSkill.where(user: @user, previous_skills: true)
    @experiences = Experience.where(user: @user)
    @message = Message.new
    @chatroom = current_user.find_or_create_chatroom_with(@user)
    @message.chatroom = @chatroom
    @recommandation = Recommandation.new
    @followings_user = FollowingsUser.where(followee: params[:id], follower: current_user).first
    @followings_user = FollowingsUser.new unless @followings_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
