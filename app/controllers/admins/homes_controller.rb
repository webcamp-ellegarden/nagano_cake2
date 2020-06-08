class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
  def top
  	@orders=Order.where(created_at:Time.zone.today.beginning_of_day..Time.zone.now)#今日の始まりから今の時間までを指定
  end
end
