class My::UsersController < ApplicationController
  def show
    @current_users_skills = UsersSkill.where(user: current_user, previous_skills: false)
    @previous_users_skills = UsersSkill.where(user: current_user, previous_skills: true)
    @experiences = Experience.where(user: current_user)
  end
end
