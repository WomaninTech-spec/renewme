class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    attr_user = [:username, :first_name, :last_name, :email, :job_position, :about_me, :role, :visible, :profile_picture]
    devise_parameter_sanitizer.permit(:sign_up, keys: attr_user)
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: attr_user)

    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
  end

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      rails_admin_path
    else
      # Change profile_path to where you want regular users to go
      stored_location_for(resource) || root_path
    end
  end
end
