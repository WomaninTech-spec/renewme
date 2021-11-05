class My::ExperiencesController < ApplicationController
  before_action :set_experience, only: [:edit, :update, :destroy]
  def new
    @experience = Experience.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
      Activity.create!(
        description: "#{view_context.link_to current_user.username, user_path(current_user)} added a new experience.",
        user: current_user
      ) if current_user.visible
      flash[:notice] = "Experience added."
      redirect_to my_user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @experience.update(experience_params)
    if @experience.save
      Activity.create!(
        description: "#{view_context.link_to current_user.username, user_path(current_user)} updated an experience.",
        user: current_user
      ) if current_user.visible
      flash[:notice] = "Experience updated."
      redirect_to my_user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @experience.destroy
    redirect_to my_user_path(current_user)
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:start_date, :end_date, :content)
  end
end
