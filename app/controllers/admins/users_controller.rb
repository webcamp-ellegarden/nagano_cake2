class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @option = params[:option]
    if @option == "search"
      @method = params[:table]
      search = params[:search]
      if @method == "1"
        @users = User.where('family_name LIKE ?', "%#{search}%").page(params[:page]).per(10)
      else
        @users = User.where('first_name LIKE ?', "%#{search}%").page(params[:page]).per(10)
      end
    else
      @users = User.page(params[:page]).per(10)
    end

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
    params.require(:user).permit(:family_name,:first_name,:email,:family_name_kana,:first_name_kana,:tel,:postal_code,:prefecture_code,:address_city,:address_street,:address_building,:password,:password_confirmation,:user_status )

  end


end
