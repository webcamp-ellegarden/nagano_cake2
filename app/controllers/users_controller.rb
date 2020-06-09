class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(current_user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(current_user.id), notice: 'User was successfully created.'
		else
			render action: :edit
		end
	end

	def unregister
		@user = User.find(params[:id])
	end

	def leave
		@user = User.find(params[:id])
			# if @user.user_status == "validity"
			    @user.update(user_status: "退会済み" )
			# end
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:family_name,:first_name,:email,:family_name_kana,:first_name_kana,:tel,:postal_code,:prefecture_code,:address_city,:address_street,:address_building,:password,:password_confirmation,:user_status )

	end
	def set_user
		@user = User.find(params[:id] || params[:user_id] )
	end
end
