class RangoFechasController < ApplicationController
	def new
     #@favor = Favor.find(params[:id])  
     @rango_fecha = Rango_fecha.new
  	end
  	def create
	    @rango_fecha = Rango_fecha.new(params.require(:rango_fecha).permit(:inf,:sup))
	    if @rango_fecha.save
	      flash[:notice] = "Se ha guardado el rango con éxito."
	      redirect_to compras_path
	    else
	      flash[:notice] = "Problemas en la creación del rango"
	      redirect_to compras_path
	    end
  	end
end
