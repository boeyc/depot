class StoreController < ApplicationController
  def index
  	@products = Product.all
    @cart = current_cart



  	#session counter
  	 	if session[:counter].nil?
  		session[:counter] = 1
  	else
  		session[:counter] += 1
  		
  		@show_message = "You've been here #{session[:counter]} times" if session[:counter]>5


  	end
  end
end
