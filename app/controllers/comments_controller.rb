class CommentsController < ApplicationController
  before_action :get_comment, only: [:edit, :update, :destroy, :show]

  def index
    @comments = Comment.all
  end

  def show
    
  end

  def new
     @comment = Comment.new
  end

  def edit
  end

  def create
    @comment= Comment.new(params.require(:comment).permit(:favor_id, :detalle))
    @comment.user = current_user
   # @comment.favor = Favor.find(params[:id])
   # @comment.favor = :favor_id
    if @comment.save
      redirect_to :back
    else
      flash[:notice] = "Debes ingresar un comentario" 
      redirect_to :back
    end
  end

  def update
  end

  def destroy
  end

  def get_comment
    @comment = Comment.find(params[:id])
  end

end
