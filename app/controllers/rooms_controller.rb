class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_rooms = current_user.rooms
    my_room_ids = []
  
    @current_rooms.each do |r|
      my_room_ids << r.id
    end
    
    @another_rooms = UserRoom.where(room_id: my_room_ids).where.not(user_id: current_user.id).order("created_at DESC")
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
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def user_room_params
    params.require(:user_room).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
