class HomeController < ApplicationController
   def index
   	@favores = Favor.order("created_at DESC")
   		if user_signed_in? 
   			if params[:titulo].present? 
   				
   			end
   		end
	end
end	
