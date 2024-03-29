class ApplicationController < ActionController::Base
 
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
     flash[:success] = "Signed in successfully."
     user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
      flash[:success] = "Signed out successfully."
      root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
