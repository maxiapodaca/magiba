class FavorsController < ApplicationController
  before_action :get_favor, only: [:edit, :update, :destroy, :show]

  def mis_favores
    if user_signed_in?
      @order_by = (params[:order_by] && params[:order_by] == "asc") ? "desc" : "asc"
      if params[:orden] && params[:orden]== "visitas"
        @favores = current_user.favors.all.order(:visitas)
        @favores = @favores.reverse_order if params[:order_by] && params[:order_by] == "desc"
      else
        @favores = current_user.favors.all
      end
    end
  end

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

  def new
    @favor = Favor.new
  end

  def edit

  end
  
  def create
    @favor= Favor.new(params.require(:favor).permit(:titulo, :descripcion, :localidad, :imagen))
    @favor.user = current_user
    if @favor.imagen.empty?
      @favor.imagen = "http://fotos.subefotos.com/13534e7f5bc5c0ee7147a0a0b782afc7o.png"
    end
    if @favor.save
      current_user.puntos= current_user.puntos - 1
      current_user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @favor.update_attributes(params.require(:favor).permit(:titulo, :descripcion, :localidad, :imagen))
    if @favor.imagen.empty?
      @favor.imagen = "http://fotos.subefotos.com/13534e7f5bc5c0ee7147a0a0b782afc7o.png"
    end
   # if @favor.update_attributes(params.require(:favor).permit(:titulo, :descripcion, :localidad, :imagen))
    if @favor.save
      redirect_to mis_favores_favors_path
    else
     render 'edit'
    end
  end

  def destroy
    @favor.destroy
    if (@favor.user == current_user)
      redirect_to mis_favores_favors_path
    else
      redirect_to root_path
    end
  end

  def show
    @favor.visitas= @favor.visitas + 1
    @favor.save
  end
def republicar
    @favor = Favor.find(params[:id])
    @favor.update(estado: 0)
    @favor.postulations.destroy_all
    @favor.visitas = 0 
    #@postulacion= @favor.postulation
    #@aux=@favor
    #@favor.destroy
  end
  private

  def get_favor
    @favor = Favor.find(params[:id])
  end
  
  


end
