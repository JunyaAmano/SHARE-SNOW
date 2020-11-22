class SkiSlope < ApplicationRecord
  has_many :events
  validates :title, presence: true, length: {maximum: 20}
end
