class RecommandationsController < ApplicationController
  before_action :set_other_user, only: :create

  def create
    @recommandation = Recommandation.new(recommandation_params)
    @recommandation.user = current_user
    if @recommandation.save
      flash[:notice] = "Recommendation sent."
      redirect_to user_path(@other_user)
    end
  end

  private
  def set_other_user
    @other_user = User.find(params[:user_id])
  end
  def recommandation_params
    params.require(:recommandation).permit(:users_skill_id, :content)
  end
end
