class MessagesController < ApplicationController
  before_action :set_other_user, only: [:new, :create]
  def index

  end

  def new
    @message = Message.new
    @chatroom = current_user.find_or_create_chatroom_with(@other_user)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @chatroom = @message.chatroom
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      #flash[:notice] = "Message sent."
      #redirect_to user_path(@other_user)
    else
      render 'chatrooms/show'
    end
  end

  private

  def set_other_user
    @other_user = User.find(params[:user_id])
  end

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
