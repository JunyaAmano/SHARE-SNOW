class Group < ApplicationRecord
  has_many :chats, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: {maximum: 30}
end
