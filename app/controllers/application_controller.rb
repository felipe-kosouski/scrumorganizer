class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_params, if: :devise_controller?
  layout :layout_by_resource

  protected
  def layout_by_resource
    if devise_controller?
      if resource_name == :user && ['edit', 'update'].include?(action_name)
        return "users/layouts/application"
      end
      return "layouts/session"
    end
    "layouts/application"
  end

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username])
  end

  def after_sign_in_path_for(resource)
    users_root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
