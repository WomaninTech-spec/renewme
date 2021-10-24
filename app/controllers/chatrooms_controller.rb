class ChatroomsController < ApplicationController
  before_action :set_chatroom
  after_action :mark_as_read
  skip_before_action :verify_authenticity_token, only: :mark_as_read

  def show
    @message = Message.new
    @message.chatroom = @chatroom
    @other_user = @chatroom.messages.where.not(user: current_user).first.user
  end

  def mark_as_read
    @chatroom.messages.where.not(user: current_user).each do |message|
      message.read = true
      message.save
    end
    msg = { status: "ok", message: "Updated" }
    respond_to do |format|
      format.html
      format.json { render json: msg }

    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
end
