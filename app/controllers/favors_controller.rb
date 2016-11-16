class FavorsController < ApplicationController
  before_action :get_favor, only: [:edit, :update, :destroy, :show]


 # def mis_favores
  #   @f = Favor.all.order(:id)
   #  if()

  #end

  def index
    @favores = Favor.all.order(:id)
  end

  def new
    @favor = Favor.new
  end

  def edit

  end
  
  def create
    @favor= Favor.new(params.require(:favor).permit(:titulo, :descripcion))
    if @favor.save
      redirect_to favors_path
    else
      render 'new'
    end
  end

  def update
    if @favor.update_attributes(params.require(:favor).permit(:titulo, :descripcion))
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