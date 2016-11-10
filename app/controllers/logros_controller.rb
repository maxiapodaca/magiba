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
      flash[:notice] = "Se ha creado el logro exitosamente."
      render :index
    else
      flash[:notice] = "Problemas en la creación del logro."
      render :new
    end
  end
    #re
    #require(:nombre, :limite_inferior_rango, :limite_superior_rango, :marca).permit(:estado, :logro_id))
  def update
    if @logro.update_attributes(params.require(:logro).permit(:nombre,:descripcion,:marca, :limite_inferior_rango,:limite_superior_rango))
      flash[:notice] = "Se ha editado el logro exitosamente."
      redirect_to logros_path
    else
      flash[:notice] = "Problemas en la edición del logro."
      render 'edit'
    end
  end
  def marcar
    @logro.marca=false
    @logro.save
    redirect_to logros_path
  end

  def destroy
    if @logro.users.count!=0
      if @logro.marca
        @logro.marca=false
      else
        @logro.marca=true
      end
      @logro.save
    else
      @logro.destroy
    end
    redirect_to logros_path
  end
end