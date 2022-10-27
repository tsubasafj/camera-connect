class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_board, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board.id)
    else
      render :edit
    end
  end

  def destroy
    if @board.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :content, :want_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
