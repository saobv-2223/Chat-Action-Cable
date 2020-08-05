class MessagesController < ApplicationController
  before_action :load_users
  before_action :load_user, only: :show

  def index; end

  def show
    @msg = Message.new
    @messages = Message.message current_user.id, params[:id]
  end

  def create
    msg = Message.new message_params
    return unless msg.save

    ActionCable.server.broadcast "room_channel:#{msg.receiver_id}", message: msg.message, sender_id: msg.sender_id
    ActionCable.server.broadcast "room_channel:#{current_user.id}", message: msg.message, sender_id: msg.sender_id
  end

  private

  def message_params
    params.require(:message).permit :message, :sender_id, :receiver_id
  end

  def load_users
    @users = @users = User.except_id current_user.id
  end

  def load_user
    @partner_user = User.find_by id: params[:id]
    return if @partner_user

    redirect_to message_path
  end
end
