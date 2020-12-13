require 'rails_helper'

RSpec.describe Message, type: :model do
  it "message, user_id, room_idがあれば有効である" do
    message = Message.new(
      message: "hoge",
      user_id: 1,
      room_id: 1
     )
  end

  it "messageがなければ無効である" do
    message = Message.new(message: nil)
    message.valid?
    expect(message.errors[:message]).to include("can't be blank")
  end

  it "messageが200文字以内である" do
    message = Message.new(message: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    message.valid?
    expect(message.errors[:message]).to include("is too long (maximum is 200 characters)")
  end

  it "user_idがなければ無効である" do
    message = Message.new(user_id: nil)
    message.valid?
    expect(message.errors[:user_id]).to include("can't be blank")
  end

  it "room_idがなければ無効である" do
    message = Message.new(room_id: nil)
    message.valid?
    expect(message.errors[:room_id]).to include("can't be blank")
  end
end
