class UserPostComment < ApplicationRecord
  belongs_to :user
  belongs_to :user_post
  has_many :notifications, dependent: :destroy
  validates :comment, presence: true

end
