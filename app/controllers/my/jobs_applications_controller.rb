class My::JobsApplicationsController < ApplicationController
  def my_jobs_applications
    @pagy, @jobs_applications = pagy(current_user.jobs_applications, items: 5)
  end

  def my_jobs_applicants
    @pagy, @jobs = pagy(current_user.jobs.order(created_at: :desc).joins(:jobs_applications).distinct, items: 5)
  end
end
