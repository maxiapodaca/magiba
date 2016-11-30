class AnswersController < ApplicationController
  before_action :get_answer, only: [:edit, :update, :destroy, :show]
  
  def index
    @answers = Answer.all
  end

  def show
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer= Answer.new(params.require(:answer).permit(:favor_id, :comment_id, :detalle))
    @answer.user = current_user
    if @answer.save
      redirect_to :back
    else
      flash[:notice] = "Debes ingresar una respuesta" 
      redirect_to :back
    end
  end

  def update
  end

  def destroy
  end

  def get_comment
    @answer = Answer.find(params[:id])
  end
end
