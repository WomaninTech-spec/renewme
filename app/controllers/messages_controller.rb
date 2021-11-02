class MessagesController < ApplicationController
  before_action :set_other_user, only: [:new, :create]
  def index
    @chatrooms = Chatroom.joins(:messages, :users).where("users.id": current_user).where.not("messages.content": "subscription").order("messages.created_at DESC").uniq
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
    p "chatroom = #{@chatroom}"
    #@other_user = @chatroom.messages.where.not(user: current_user).first.user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom.id,
        render_to_string(partial: "message", locals: { message: @message })
      )
      NotificationsChannel.broadcast_to(@other_user.id, render_to_string(partial: "notifications/notification", locals: { user: current_user }))
      #flash[:notice] = "Message sent."
      #redirect_to user_path(@other_user)
    else
      render 'chatrooms/show'
    end
  end

  def messages_unread
    @chatrooms = Chatroom.eager_load(:messages).where("messages.user_id = ?", current_user.id)
    @count = 0
    @chatrooms.each do |chatroom|
      @count += chatroom.messages.where.not(user: current_user, read: true).count
    end
    respond_to do |format|
      msg = { status: "ok", unread: @count }
      format.json { render json: msg } # don't do msg.to_json
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
