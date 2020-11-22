class UserPostFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :user_post

  validates :user_id, presence: true
  validates :user_post_id, presence: true
  validates_uniqueness_of :user_post_id, scope: :user_id
end
