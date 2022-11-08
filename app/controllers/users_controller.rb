class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :move_to_index, except: :show
  
  def show
    @current_user_room = UserRoom.where(user_id: current_user.id)
    @receive_user = UserRoom.where(user_id: @user.id)

    unless @user.id == current_user.id
      @current_user_room.each do |cu|
        @receive_user.each do |u|
          if cu.room_id == u.room_id
            @have_room = true
            @room_id = cu.room_id
          end
        end
      end
      unless @have_room
        @room = Room.new
        @user_room = UserRoom.new
      end
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :camera, :camera_career, :model_career, :avatar)
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @user.id
  end
end
