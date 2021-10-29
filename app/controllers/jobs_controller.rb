class JobsController < ApplicationController
  def index
    if params[:query] && !params[:query].empty?
      @pagy, @jobs = pagy(Job.job_search(params[:query]).where.not(visible: false, user_id: current_user), items: 12)
    else
      @pagy, @jobs = pagy(Job.where.not(visible: false, id: current_user), items: 12)
    end
  end
end
