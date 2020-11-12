class UserPost < ApplicationRecord
  belongs_to :user
  has_many :user_post_comments, dependent: :destroy
  has_many :user_post_favorites, dependent: :destroy
  attachment :image
  
   def favorited_by?(user)
    user_post_favorites.where(user_id: user.id).exists?
  end
end
