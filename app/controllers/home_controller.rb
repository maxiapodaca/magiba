class HomeController < ApplicationController
  def index
  	@order_by = (params[:order_by] && params[:order_by] == "asc") ? "desc" : "asc"
    if params[:orden] && params[:orden]== "visitas"
      @favores = Favor.all.order(:visitas)
      @favores = @favores.reverse_order if params[:order_by] && params[:order_by] == "desc"
    else
      @favores = Favor.all
    end

    if user_signed_in?
      if params[:titulo].present? 
        @favores = Favor.where('LOWER(titulo) LIKE ?',"%#{params[:titulo].downcase}%")
      end
      if params[:localidad].present? 
        @favores = @favores.where('LOWER(localidad) LIKE ?',"%#{params[:localidad].downcase}%")
      end
    end

  end
end