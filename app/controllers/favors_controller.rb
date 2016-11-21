class FavorsController < ApplicationController
  before_action :get_favor, only: [:edit, :update, :destroy, :show]

  def mis_favores
    @order_by = (params[:order_by] && params[:order_by] == "asc") ? "desc" : "asc"
    if params[:orden] && params[:orden]== "visitas"
      @favores = current_user.favors.all.order(:visitas)
      @favores = @favores.reverse_order if params[:order_by] && params[:order_by] == "desc"
    else
      @favores = current_user.favors.all
    end
  end

  def index
    @order_by = (params[:order_by] && params[:order_by] == "asc") ? "desc" : "asc"
    if params[:orden] && params[:orden]== "visitas"
      @favores = Favor.all.order(:visitas)
      @favores = @favores.reverse_order if params[:order_by] && params[:order_by] == "desc"
    else
      @favores = Favor.all
    end

>>>>>>> 2171b009a0acce5c334a8a390576380584af4a6f
    if params[:titulo].present? 
      @favores = Favor.where('LOWER(titulo) LIKE ?',"%#{params[:titulo].downcase}%")
    end
    if params[:localidad].present? 
      @favores = @favores.where('LOWER(localidad) LIKE ?',"%#{params[:localidad].downcase}%")
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
    if @favor.save
      current_user.puntos= current_user.puntos - 1
      current_user.save
      redirect_to favors_path
    else
      render 'new'
    end
  end

  def update
    if @favor.update_attributes(params.require(:favor).permit(:titulo, :descripcion, :localidad, :imagen))
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
      redirect_to favors_path
    end
  end

  def show
    @favor.visitas= @favor.visitas + 1
    @favor.save
  end

  private

  def get_favor
    @favor = Favor.find(params[:id])
  end
  
end
