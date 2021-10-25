class SkillsController < ApplicationController
  def search
    @skills = []
    Skill.global_search(params[:term]).each do |skill|
      @skills << { id: skill.id, text: skill.name }
    end

    respond_to do |format|
      format.json { render json: @skills }
    end
  end
end
