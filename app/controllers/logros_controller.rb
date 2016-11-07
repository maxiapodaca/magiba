class LogrosController < ApplicationController
  before_action :get_logro, only: [:edit, :update, :destroy, :show, :marcar]

  def get_logro
    @logro = Logro.find(params[:id])
  end
  def new
    @logro = Logro.new
  end
    
  def index
    @logro = Logro.all
  end

  def show
    @logro = Logro.find(params[:id])
  end

  def edit  
  end

  def create
   
    @logro = Logro.new(params.require(:logro).permit(:nombre,:descripcion,:marca, :limite_inferior_rango,:limite_superior_rango))
    if @logro.save
      flash[:notice] = "Se creo"
      redirect_to logros_path
    else
     flash[:notice] = "NO Se creo"
      render :new
    end
    #require(:nombre, :limite_inferior_rango, :limite_superior_rango, :marca).permit(:estado, :logro_id))
  end

  def update
    if @logro.update_attributes(params.require(:logro).permit(:nombre,:descripcion,:marca, :limite_inferior_rango,:limite_superior_rango))
      redirect_to logros_path
    else
     render 'edit'
    end
  end
  def marcar
    @logro.marca=false
    @logro.save
    redirect_to logros_path
  end

  def destroy
    if @logro.marca
      @logro.marca=false
    else
      @logro.marca=true
    end
    @logro.save
    redirect_to logros_path
  end
end