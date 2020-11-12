class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image

  has_many :user_posts, dependent: :destroy
  has_many :user_post_comments, dependent: :destroy
  has_many :user_post_favorites, dependent: :destroy
end
