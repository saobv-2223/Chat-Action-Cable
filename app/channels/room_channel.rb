class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
