class HomeController < ApplicationController
  def index  	
  	@order_by = (params[:order_by] && params[:order_by] == "asc") ? "desc" : "asc"
    if params[:orden] && params[:orden]== "visitas"
      @favores = Favor.all.order(:visitas)
      @favores = @favores.reverse_order if params[:order_by] && params[:order_by] == "desc"
    else
      @favores = Favor.all.order(:id)
    end

    if user_signed_in? 
      if params[:titulo].present? 
        @favores = Favor.where('titulo LIKE ?',"%#{params[:titulo]}%")
      end
    end

  end
end