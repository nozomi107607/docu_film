class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

   config.time_zone = 'Asia/Tokyo'
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:log_in, keys: [:user_name])
  end

  def
    after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

end
