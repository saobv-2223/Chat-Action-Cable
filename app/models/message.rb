class Message < ApplicationRecord
  scope :get_messages, (lambda do |sender_id, receiver_id|
    where("sender_id = #{sender_id} AND receiver_id = #{receiver_id}")
      .or(where("sender_id = #{receiver_id} AND receiver_id = #{sender_id}"))
  end)

  def send_message
    ActionCable.server.broadcast "room_channel:#{receiver_id}",
                                 message: message,
                                 sender_id: sender_id
    ActionCable.server.broadcast "room_channel:#{sender_id}",
                                 message: message,
                                 sender_id: sender_id
  end
end
