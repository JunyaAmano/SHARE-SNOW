class UserPostFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :user_post
end
