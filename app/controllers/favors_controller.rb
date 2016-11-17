class FavorsController < ApplicationController
  before_action :get_favor, only: [:edit, :update, :destroy, :show]


  def mis_favores
    @favores = Favor.all.order(:id)

  end

  def index
    @favores = Favor.all.order(:id)
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
    redirect_to favors_path
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
