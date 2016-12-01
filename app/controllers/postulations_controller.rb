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
    if  (params[:postulation][:fecha].to_date == nil)
        flash[:notice] = "Debe ingresar una fecha"
        redirect_to :back
    else
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
  end

  def update
    @postulation.update_attributes(params.require(:postulation).permit(:name))
     redirect_to favors_path
  end

  def destroy
    @postulation.destroy
  end

  def edit
    @postulation = Postulation.all.order(:id)
  end

 def evaluar
  @postulation = Postulation.find(params[:id])
  @postulation.update(aceptar:params[:aceptar], noaceptar:params[:noaceptar]) 
   @postulation.favor.update(estado: 1) 
  if params[:aceptar] == "true"    
   params[:noaceptar] == "false"        
   flash[:notice] = "Postulacion aceptada"      
  end   
 redirect_to :back 
end

def evaluar1
  @postulation = Postulation.find(params[:id])
  @postulation.update(cumplio:params[:cumplio])   
  @postulation.update(nocumplio:params[:nocumplio])
  user = @postulation.user  
  if params[:cumplio] == "true"
     flash[:notice] = "Esta postulacion se cumplio"
     user.puntos += 1
   else
     if params[:nocumplio] == "false"      
        flash[:alert] = "Esta postulacion no se cumplio "   
        user.puntos -= 2 
     end      
  end
  user.save 
  redirect_to :back  
 end

 
end
