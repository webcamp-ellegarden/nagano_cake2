class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
  def top
  	@orders=Order.where(created_at:Date.today)#今日の日付をしてい
  end
end
