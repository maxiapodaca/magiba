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
    @compra = Compra.new(params.require(:compra).permit(:cantidad_de_puntos,:user_id,:card_id))
    if @compra.save
      current_user.puntos= current_user.puntos + @compra.cantidad_de_puntos
      current_user.save
      @plata=@compra.cantidad_de_puntos * 12
      flash[:notice] = "Se ha realizado la compra de #{@compra.cantidad_de_puntos} puntos exitosamente,se debitaron $#{@plata} de su tarjeta de crédito."
      if Card.find(@compra.card_id).recordar == false
        current_user.cards.find(@compra.card_id).destroy
      end
      redirect_to favors_path
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
