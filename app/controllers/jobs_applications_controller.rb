class JobsApplicationsController < ApplicationController
  before_action :set_job
  def create
    @jobs_application = JobsApplication.new
    @jobs_application.job = @job
    @jobs_application.user = current_user
    if @jobs_application.save
      flash[:notice] = "You applied successfully to this job."
      redirect_to @job
    else
      render "jobs/show"
    end
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end
end
