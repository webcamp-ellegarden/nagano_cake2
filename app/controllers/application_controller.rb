class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		case resource
		when Admin
			admins_homes_top_path
		when User
			products_path
		end
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:family_name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
		devise_parameter_sanitizer.permit(:account_update, keys: [:email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_kana])
		devise_parameter_sanitizer.permit(:account_update, keys: [:family_name_kana])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name_kana])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:tel])
		devise_parameter_sanitizer.permit(:account_update, keys: [:tel])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:postal_code])
		devise_parameter_sanitizer.permit(:account_update, keys: [:postal_code])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:prefecture_code])
		devise_parameter_sanitizer.permit(:account_update, keys: [:prefecture_code])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:address_city])
		devise_parameter_sanitizer.permit(:account_update, keys: [:address_city])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:address_street])
		devise_parameter_sanitizer.permit(:account_update, keys: [:address_street])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:address_building])
		devise_parameter_sanitizer.permit(:account_update, keys: [:address_building])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:password])
		devise_parameter_sanitizer.permit(:account_update, keys: [:password])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:password])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:password_confirmation])
		devise_parameter_sanitizer.permit(:account_update, keys: [:password_confirmation])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:password_confirmation])
	end

end
