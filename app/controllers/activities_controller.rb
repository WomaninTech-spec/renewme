class ActivitiesController < ApplicationController
  def index
    @pagy, @activities = pagy(Activity.order(created_at: :desc)
                                      .joins("INNER JOIN followings_users ON activities.user_id = followings_users.followee_id")
                                      .joins("INNER JOIN users ON activities.user_id = users.id").where("users.visible = ?", true)
                                      .where("followings_users.follower_id = ?", current_user).limit(100), items: 20)
  end
end
