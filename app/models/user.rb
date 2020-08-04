class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :except_id, ->(id){where.not id: id}
end
