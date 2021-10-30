class JobsController < ApplicationController
  before_action :set_job, only: :show
  def index
    if params[:query] && !params[:query].empty?
      @pagy, @jobs = pagy(Job.job_search(params[:query]).where.not(visible: false, user_id: current_user), items: 12)
    else
      @pagy, @jobs = pagy(Job.where.not(visible: false, user_id: current_user), items: 12)
    end
  end

  def show
    @jobs_application = JobsApplication.where(user: current_user, job: @job).first
    @jobs_application = JobsApplication.new if @jobs_application.nil?
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
end
