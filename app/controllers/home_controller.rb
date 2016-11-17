class HomeController < ApplicationController
   def index
   	@favores = Favor.order("created_at DESC")
   		if user_signed_in? 
   			if params[:titulo].present? 
   				@favores = Favor.where('titulo LIKE ?',"%#{params[:titulo]}%")
   			end
   		end
	end
end	
