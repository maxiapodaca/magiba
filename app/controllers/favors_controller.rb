class FavorsController < ApplicationController
  before_action :get_favor, only: [:edit, :update, :destroy, :show]

  def index
    @favores = Favor.all.order(:id)
  end

  def new
    @favor = Favor.new
  end

  def edit

  end
  
  def create
    @favor= Favor.new(params.require(:favor).permit(:titulo, :descripcion, :localidad))
    @favor.user = current_user
    if @favor.save
      redirect_to favors_path
    else
      render 'new'
    end
  end

  def update
    if @favor.update_attributes(params.require(:favor).permit(:titulo, :descripcion, :localidad))
      redirect_to favors_path
    else
     render 'edit'
    end
  end

  def destroy
    @favor.destroy
    redirect_to favors_path
  end

  def show
  end

  private

  def get_favor
    @favor = Favor.find(params[:id])
  end
  
end 
