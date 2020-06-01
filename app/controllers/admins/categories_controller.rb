class Admins::CategoriesController < ApplicationController
  
  def index
  	@category =Category.new
  	@categores =Category.all
  end

  def create
  	@category =Category.new(category_params)
  	if @category.save 
  		redirect_to admins_categories_path
  	else
      flash[:notice]="errors"
  		render 'index'
    end
  end

  private

  def category_params
  	params.require(:category).permit(:name,:category_status)
  end

end