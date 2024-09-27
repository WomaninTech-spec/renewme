class My::JobsApplicationsController < ApplicationController
  def my_jobs_applications
    @pagy, @jobs_applications = pagy(current_user.jobs_applications, items: 5)
    @pagy_follow, @followings_jobs = pagy(@current_user.followings_jobs, page_param: :page_follow, items: 5)
  end

  def my_jobs_applicants
    @pagy_jobs, @jobs = pagy(current_user.jobs, page_param: :page_jobs, items: 8)
    @pagy, @jobs = pagy(current_user.jobs.order(created_at: :desc).joins(:jobs_applications).distinct, items: 5)
  end
end
