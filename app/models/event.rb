class Event < ApplicationRecord
  attachment :image
  has_many :event_users, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  belongs_to :ski_slope
  belongs_to :user

  validates :title, presence: true, length: {maximum: 30}
	validates :description, presence: true, length: {maximum: 700}
	validates :title, :departure_date, :return_date, :deadline_date, :applicant_number, presence: true



  def applied_by?(user)
    event_users.where(user_id: user.id).exists?
  end

  # イベント申しこみの際に「応募人数上限を超えておらず、申し込み期限内」かをチェック
  def authorized_by?(event)
    (event.applicant_number > event.event_users.count) && event.deadline_date > Time.now
  end

  # イベント申し込み用通知メソッド
  #通知機能用
  def create_notification_apply!(current_user)
   # すでに「申し込み」されているか検索
   temp = Notification.where(["visitor_id = ? and visited_id = ? and event_id = ? and action = ? ", current_user.id, user_id, id, 'apply'])
   # いいねされていない場合のみ、通知レコードを作成
   if temp.blank?
    notification = current_user.active_notifications.new(
    event_id: id,
    visited_id: user_id,
    action: 'apply'
     )
   # 自分の投稿に対するいいねの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
     notification.checked = true
    end
     notification.save if notification.valid?
   end
  end
end
