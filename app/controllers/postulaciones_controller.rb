class PostulacionesController < ApplicationController
  def index
    @postulaciones = Postulacion.all.order(:id)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create

  end

  def update
  end

  def destroy
  end

  private

  def get_postulacion
    @postulacion = Postulacion.find(params[:id])
  end
end
