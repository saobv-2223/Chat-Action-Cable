class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_messages,
           class_name: Message.name,
           foreign_key: :sender_id,
           dependent: :destroy
  has_many :received_messages,
           class_name: Message.name,
           foreign_key: :receiver_id,
           dependent: :destroy

  scope :except_id, ->(id){where.not id: id}
end
