class My::UsersSkillsController < ApplicationController
  before_action :set_users_skill, only: [:edit, :update, :destroy]
  def new
    @users_skill = UsersSkill.new
    @skills = Skill.all.limit(100)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    params[:users_skill][:level] = params[:users_skill][:level].to_i unless params[:users_skill][:level] == ""
    @users_skill = UsersSkill.new(users_skill_params)
    @users_skill.user = current_user
    if @users_skill.save
      flash[:notice] = "Skill added."
      redirect_to my_user_path(current_user)
    else
      @skills = Skill.all
      render 'new'
    end
  end

  def edit
  end

  def update
    params[:users_skill][:level] = params[:users_skill][:level].to_i unless params[:users_skill][:level] == ""
    @users_skill.update(users_skill_params)
    if @users_skill.save
      flash[:notice] = "Skill updated."
      redirect_to my_user_path(current_user)
    end
  end

  def destroy
    @users_skill.destroy
    redirect_to my_user_path(current_user)
  end

  private

  def set_users_skill
    @users_skill = UsersSkill.find(params[:id])
  end

  def users_skill_params
    params.require(:users_skill).permit(:skill_id, :level, :previous_skills)
  end
end
