class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def create
    @room = Room.create
    @user_room1 = UserRoom.create(room_id: @room.id, user_id: current_user.id)
    @user_room2 = UserRoom.create(user_room_params)
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if UserRoom.where(user_id: current_user.id,room_id: @room.id).present?
      @message = Message.new
      @user_rooms = @room.user_rooms
      @partner = User.where.not(id:current_user.id)
      @my_messages=Message.where(user_id: current_user.id)
      @other_messages=Message.where(user_id: @partner)
      @messages=@my_messages.or(@other_messages)#リレーションオブジェクト達を結合する
      @messages=@messages.order(:created_at)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_room_params
    params.require(:user_room).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
