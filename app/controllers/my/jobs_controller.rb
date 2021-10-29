class My::JobsController < ApplicationController
  def index
    @jobs = current_user.jobs
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to my_user_job_path(current_user,@job)
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      redirect_to my_user_job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "You have successfully deleted this job."
    redirect_to my_user_jobs_path(current_user)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :visible)
  end
end
