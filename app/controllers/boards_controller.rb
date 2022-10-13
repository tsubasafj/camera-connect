class BoardsController < ApplicationController
  def index
    @boards = Board.includes(:user).order('created_at DESC').page(params[:page]).per(4)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit

  end

  def update
    
  end

  private

  def board_params
    params.require(:board).permit(:title, :content, :want_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
