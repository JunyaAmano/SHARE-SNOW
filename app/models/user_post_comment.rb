class UserPostComment < ApplicationRecord
  belongs_to :user
  belongs_to :user_post
  validates :comment, presence: true
  
end
