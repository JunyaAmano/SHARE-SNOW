class EventUser < ApplicationRecord
  has_many :event_users
  has_many :users, through: :event_users
  belongs_to :ski_slope
end
