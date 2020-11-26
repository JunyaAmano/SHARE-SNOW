class SkiSlope < ApplicationRecord
  has_many :events
  has_many :users
  validates :title, presence: true, length: {maximum: 20}
end
