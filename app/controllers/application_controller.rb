class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
  case resource
  when Admin
    admins_homes_top_path
  when User
    products_path
  end
 end
 


end
