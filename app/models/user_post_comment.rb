class UserPostComment < ApplicationRecord
  belongs_to :user
  belongs_to :user_post
  has_many :notifications, dependent: :destroy
  validates :user_id, :user_post_id, presence: true
  validates :comment, presence: true, length: {maximum: 200}
end
