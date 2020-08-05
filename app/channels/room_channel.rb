class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end

  def appear data
    ActionCable.server.broadcast "room_channel:#{current_user.id}",
                                 status: data.status
  end
end
