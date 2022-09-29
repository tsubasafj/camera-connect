class BoardsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def board_params
    params.require(:board).permit(:title, :content, :want_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
