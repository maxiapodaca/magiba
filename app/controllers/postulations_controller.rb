class PostulationsController < ApplicationController
  def index
    #@postulation = Postulation.all.order(:id)
    #@postulation.favor = Favor.find(params[:id])
    
  end

  def new
     #@favor = Favor.find(params[:id])  
     @postulation = Postulation.new

  end

  def show
    @postulation = Postulation.find(params[:id])
    @user = @postulacion.user
  end

  def create
    #@favor = Favor.find(params[:id])
    @postulation= Postulation.new(params.require(:postulation).permit(:favor_id, :fecha, :descripcion ))
    @postulation.user = current_user
    if @postulation.save
      flash[:notice] = "Se ha postulado exitosamente."
      redirect_to favor_path(@postulation.favor)
    else
      flash[:notice] = "Problemas en postulacion del logro, complete todos los campos."     
      redirect_to :back
    end
  end

  def update
    @postulation.update_attributes(params.require(:postulation).permit(:name))
     redirect_to favors_path
  end

  def destroy
    if @postulation.aceptar
        @postulation.aceptar=false
    else
        @postulation.aceptar=true
    end
      @postulation.save
  end

  def edit
    @postulation = Postulation.all.order(:id)
  end

end
