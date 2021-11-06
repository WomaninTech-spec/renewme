class FollowingsJobsController < ApplicationController
  def create
    @followings_job = FollowingsJob.new
    @followings_job.job = Job.find(params[:followings_job][:job_id])
    @followings_job.user = current_user
    if @followings_job.save
      flash[:notice] = "You follow this job."
      redirect_to @followings_job.job
    else
      render 'jobs/show'
    end
  end

  def destroy
    @followings_job = FollowingsJob.find(params[:id])
    @followings_job.destroy
    flash[:notice] = "You no longer follow this job."
    redirect_to @followings_job.job
  end
end
