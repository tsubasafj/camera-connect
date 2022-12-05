class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.includes(:user).order('created_at DESC')
  end

  def create
    @room = Room.create
    @user_room1 = UserRoom.create(room_id: @room.id, user_id: current_user.id)
    @user_room2 = UserRoom.create(user_room_params)
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    if UserRoom.where(user_id: current_user.id,room_id: @room.id).present?
      @message = Message.new
      @messages = @room.messages
      @user_room = @room.user_rooms
    else
      redirect_to user_path(@partner)
    end
  end

  private

  def user_room_params
    params.require(:user_room).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
