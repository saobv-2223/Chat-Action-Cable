class Message < ApplicationRecord
  belongs_to :sent, class_name: User.name
  belongs_to :received, class_name: User.name
  scope :get_messages, (lambda do |sender_id, receiver_id|
    where("sender_id = #{sender_id} AND receiver_id = #{receiver_id}")
      .or(where("sender_id = #{receiver_id} AND receiver_id = #{sender_id}"))
  end)
end
