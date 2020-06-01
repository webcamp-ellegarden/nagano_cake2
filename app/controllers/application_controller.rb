class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    flash[:notice] = "successfully"
    admins_homes_top_path(resource)
  end

  def after_sign_out_path_for(resource) 
    flash[:notice] = "Signed out successfully."
    new_admin_session_path
  end
end
