class MessagesController < ApplicationController
  before_action :load_users
  before_action :load_user, only: :show

  def index; end

  def show
    @msg = Message.new
    @messages = Message.get_messages current_user.id, params[:id]
  end

  def create
    message = Message.new message_params
    return unless message.save

    message.send_message
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
