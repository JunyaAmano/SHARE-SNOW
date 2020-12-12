class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :room, optional: true
  belongs_to :message, optional: true
  belongs_to :user_post, optional: true
  belongs_to :user_post_comment, optional: true
  belongs_to :event, optional: true
  belongs_to :event_comment, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
