class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :message, presence: true, length: {maximum: 200}
  validates :user_id, :room_id, presence: true
  has_many :notifications, dependent: :destroy



end
