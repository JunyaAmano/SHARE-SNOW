class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user_id, presence: true
  validates :event_id, presence: true
  validates_uniqueness_of :event_id, scope: :user_id

  #イベント応募者の数を制限（機能しない）
  # validate :check_number_of_applicants

  # def check_number_of_applicants
  # if event && event.event_users.count > event.applicant_number
  # errors.add(:event, "人数OVER")
  # end
  # end

end
