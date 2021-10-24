class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @users = User.where.not(visible: false, confirmed_at: nil, id: current_user, role: 1).order(created_at: :desc).limit(6)
    @articles = Article.order(created_at: :desc).limit(6)
    @jobs = Job.order(created_at: :desc).limit(6)
  end
end
