class JobsController < ApplicationController
  def index
    @jobs = job.all
  end
  def show
    @job = Job.find(params[:id])
  end
  def new
    @job = Job.new
  end
  def create
    Job.create(params[:job])
  end
  def edit
    @job = Job.find(params[:id])
  end
  def update
    @job = Job.find(params[:id])
    @job.update(params[:job])
  end
  def destroy
    @jobs = Articles.find(params[:id])
    @jobs.destroy
    flash[:notice] = "You have successfully deleted this job."
    redirect_to jobs_path
  end
end
