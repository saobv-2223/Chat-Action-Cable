class ChatsController < ApplicationController
  def index
    @users = User.except_id current_user.id
  end
end
