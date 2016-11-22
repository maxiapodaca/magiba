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
    
        
  end

  def create
    #@favor = Favor.find(params[:id])    
    #(params[:postulation][:fecha] == nil) && 
    if (params[:postulation][:fecha].to_date >= Date.today) 
          @postulation= Postulation.new(params.require(:postulation).permit(:favor_id, :fecha, :descripcion ))
          @postulation.user = current_user
        if @postulation.save
          flash[:notice] = "Se ha postulado exitosamente."
          redirect_to :back
         # redirect_to favors_path
        else
          flash[:notice] = "Problemas en postulacion del logro, complete todos los campos."     
          redirect_to :back
        end
    else
      flash[:notice] = "La fecha es incorrecta "     
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

 def evaluar
   @postulation = Postulation.find(params[:id])
   @postulation.update(aceptar:params[:aceptar])
   @postulation.update(noaceptar:params[:noaceptar])
   user = @postulation.user
   if params[:aceptar] == "true"
    user.puntos += 1     
    flash[:notice] = "Postulacion aceptada"
   else 
      if params[:noaceptar] == "false"      
         flash[:notice] = "Postulacion NO aceptada"   
         user.puntos -= 2 
      end      
   end
   user.save 
   redirect_to @postulation  
 end

end
