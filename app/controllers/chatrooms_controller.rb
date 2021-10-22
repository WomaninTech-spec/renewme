class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @message.chatroom = @chatroom
    @other_user = @chatroom.messages.where.not(user: current_user).first.user
  end
end
