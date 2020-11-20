class Event < ApplicationRecord
  attachment :image
  has_many :event_users
  has_many :event_comments
  has_many :users, through: :event_users
  has_many :events
  belongs_to :ski_slope
  belongs_to :user

  def applied_by?(user)
    event_users.where(user_id: user.id).exists?
  end
end
