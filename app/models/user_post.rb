class UserPost < ApplicationRecord
  belongs_to :user
  has_many :user_post_comments, dependent: :destroy
  has_many :user_post_favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy

  attachment :image

  validates :content, presence: true, length: {maximum: 200}
  validates :user_id, presence: true

  def favorited_by?(user)
   user_post_favorites.where(user_id: user.id).exists?
  end

  #通知機能用
  def create_notification_favorite!(current_user)
   # すでに「いいね」されているか検索
   temp = Notification.where(["visitor_id = ? and visited_id = ? and user_post_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
   # いいねされていない場合のみ、通知レコードを作成
   if temp.blank?
    notification = current_user.active_notifications.new(
    post_id: id,
    visited_id: user_id,
    action: 'favorite'
     )
   # 自分の投稿に対するいいねの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
     notification.checked = true
    end
    if notification.valid?
     notification.save
    end
   end
  end
end
