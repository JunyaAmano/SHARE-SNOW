class EventComment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :comment, presence: true, length: {maximum: 200}
  validates :user_id, :event_id, presence: true
end
