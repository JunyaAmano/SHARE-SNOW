class EventComment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :comment, presence: true, length: {maximum: 200}
  validates :user_id, :event_id, presence: true

  def create_notification_event_comment!(current_user, event_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = EventComment.select(:user_id).where(event_comment_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_event_comment!(current_user, event_comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    if temp_ids.blank?
      save_notification_event_comment!(current_user, event_comment_id, user_id)
    end
  end

  def save_notification_event_comment!(current_user, user_post_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      event_post_id: id,
      event_comment_id: comment_id,
      visited_id: visited_id,
      action: 'event_comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    if notification.valid?
      notification.save
    end
  end
end


