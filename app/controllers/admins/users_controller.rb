class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@users =User.page(params[:page]).per(8)
  end

  def show
  	@user =User.find(params[:id])
  end
  
  def edit
  	@user =User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to admins_users_path
  	else
      flash[:notice]="error"
  		render "edit"
  	end
  end

  private
  def user_params
    params.require(:user).permit(:family_name,:first_name,:email,:family_name_kana,:first_name_kana,:tel,:postal_code,:prefecture_code,:address_city,:address_street,:address_building,:password,:password_confirmation,:user_status)

  end


end
