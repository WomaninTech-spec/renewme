class My::UsersSkillsController < ApplicationController
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

  def destroy
    @users_skill = UsersSkill.find(params[:id])
    @users_skill.destroy
    redirect_to my_user_path(current_user)
  end

  private

  def users_skill_params
    params.require(:users_skill).permit(:skill_id, :level, :previous_skills)
  end

end
