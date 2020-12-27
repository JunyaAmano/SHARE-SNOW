class Chat < ApplicationRecord
  after_create_commit { BroadcastChatJob.perform_later self }
  belongs_to :user
  belongs_to :group
  validates :content, presence: true, length: {maximum: 200}

end
