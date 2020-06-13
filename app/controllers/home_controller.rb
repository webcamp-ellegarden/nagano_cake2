class HomeController < ApplicationController
	def home
      @products = Product.first(4)
	end
end
