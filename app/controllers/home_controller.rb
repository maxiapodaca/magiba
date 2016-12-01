class HomeController < ApplicationController
  def index
  	@order_by = (params[:order_by] && params[:order_by] == "asc") ? "desc" : "asc"
    if params[:orden] && params[:orden]== "visitas"
      @favores = Favor.where(estado: 0).order(:visitas)
      @favores = @favores.reverse_order if params[:order_by] && params[:order_by] == "desc"
    else
      @favores = Favor.where(estado: 0)
    end

    if user_signed_in?
      if params[:titulo].present? 
        @favores = @favores.where('LOWER(titulo) LIKE ?',"%#{params[:titulo].downcase}%")
      end
      if params[:localidad].present? 
        @favores = @favores.where('LOWER(localidad) LIKE ?',"%#{params[:localidad].downcase}%")
      end
    end
  end
  
end