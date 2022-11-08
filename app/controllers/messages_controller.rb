class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create      
    @room = Room.find(params[:room_id])
    if UserRoom.where(user_id: current_user.id, room_id: params[:room_id]).present?
      @message = Message.create(message_params)
    else
      flash[:alert] = "Error"
    end
    redirect_to room_path(@room)
  end
 
  private

  def message_params
    params.require(:message).permit(:user_id, :room_id, :content).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
