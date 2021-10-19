class My::ExperiencesController < ApplicationController
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
      flash[:notice] = "Experience added."
      redirect_to my_user_path(current_user)
    else
      render 'new'
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to my_user_path(current_user)
  end

  private

  def experience_params
    params.require(:experience).permit(:content)
  end
end
