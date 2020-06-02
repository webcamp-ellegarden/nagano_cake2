class Admins::UsersController < ApplicationController
  def index
  	@users =User.all
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


end
