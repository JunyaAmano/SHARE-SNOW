class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }

  def template
    ApplicationController.renderer.render partial: "chats/chat", locals: { chat: self }
  end

end
