class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
    @card = Card.new(params.require(:card).permit(:numero,:nombre,:anio_vencimiento,:mes_vencimiento, :nombre_prop,:apellido_prop,:dni_titular,:cod_seguridad,:user_id))
    @card.user = current_user
    if @card.save
      flash[:notice] = "Se ha guardado su tarjeta exitosamente."
      redirect_to new_compra_path
    else
      flash[:notice] = "Problemas en el registro de su tarjeta."
      render :new
    end
  end

  def index
  end
end
