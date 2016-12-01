class ComprasController < ApplicationController
  def get_compra
  end

  def new
    @compra = Compra.new
  end

  def index
    if params[:fecha_inf].present? and params[:fecha_sup].present? 
      if params[:fecha_inf] > params[:fecha_sup]
        flash[:alert] = "Error. La fecha superior debe ser posterior a la fecha inferior. Re-ingrese las fechas."
        @testigo = false
      else
        @testigo = true
        if params[:fecha_inf].to_date > Date.today  
          flash[:alert] = "Error. La fecha superior no puede ser superior a la fecha actual. Re-ingrese la fecha superior."
          @testigo = false
          render :index
        else
          @compras_a_sumar = Compra.where('created_at >= ?',"%#{params[:fecha_inf].to_date.beginning_of_day}%")
        end
        if params[:fecha_sup].to_date > Date.today
            flash[:alert] = "Error. La fecha superior no puede ser superior a la fecha actual. Re-ingrese la fecha superior."
            @testigo = false
            render :index
        else
            if @compras_a_sumar != nil 
              @compras_a_sumar = @compras_a_sumar.where('created_at <= ?',"%#{params[:fecha_sup].to_date.to_date.end_of_day}%")
            else
              @compras_a_sumar = Compra.where('created_at <= ?',"%#{params[:fecha_sup].to_date}%")
            end
        end
      end
    else
      @testigo = false
    end
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
      current_user.cards.each do |l|
        if l.recordar == false
          current_user.cards.find(l.id).destroy
        end
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
