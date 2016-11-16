class PostulationsController < ApplicationController
  def index
    @postulation = Postulation.all.order(:id)
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
      redirect_to favor_path(@postulation.favor)
    else
      redirect_to :back
    end
  end

  def update

    @postulation.update_attributes(params.require(:postulation).permit(:name))
     redirect_to favors_path
  end

  def destroy
  end

  def misPostulaciones
  end

  def edit
    @postulation = Postulation.all.order(:id)
  end
end
