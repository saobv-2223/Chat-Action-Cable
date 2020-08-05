class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_messages, class_name: Message.name, foreign_key: :sender_id
  has_many :received_messages, class_name: Message.name, foreign_key: :receiver_id
  has_many :s_messages, through: :sent_messages, source: :sent
  has_many :r_messages, through: :received_messages, source: :received

  scope :except_id, ->(id){where.not id: id}
end
