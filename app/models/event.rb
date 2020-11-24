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

end
