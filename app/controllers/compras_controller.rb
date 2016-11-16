class ComprasController < ApplicationController
  def get_compra
  end

  def new
    @compra = Compra.new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    if (current_user.tarjetas.count)
    @compra = Compra.new(params.require(:compra).permit(:cantidad_de_puntos,:user_id))
    if @compra.save
      flash[:notice] = "Se ha realizado la compra exitosamente."
      render :index
    else
      flash[:notice] = "Problemas en la realización de la compra."
      render :new
    end
  end

  def update
  end

  def destroy
  end
end
