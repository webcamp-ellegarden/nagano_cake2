class Admins::HomesController < ApplicationController
  def top
  	@orders=Order.where(created_at:Date.today)#今日の日付をしてい
  end
end
