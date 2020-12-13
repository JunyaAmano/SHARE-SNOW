require 'rails_helper'

RSpec.describe EventComment, type: :model do

  it "comment, user_id, event_idがあれば有効である" do
    event_comment = EventComment.new(
      comment: "hoge",
      user_id: 1,
      event_id: 1
     )
  end

  it "commentがなければ無効である" do
    event_comment = EventComment.new(comment: nil)
    event_comment.valid?
    expect(event_comment.errors[:comment]).to include("can't be blank")
  end

  it "commentが200文字以内である" do
    event_comment = EventComment.new(comment: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    event_comment.valid?
    expect(event_comment.errors[:comment]).to include("is too long (maximum is 200 characters)")
  end

  it "user_idがなければ無効である" do
    event_comment = EventComment.new(user_id: nil)
    event_comment.valid?
    expect(event_comment.errors[:user_id]).to include("can't be blank")
  end

  it "event_idがなければ無効である" do
    event_comment = EventComment.new(event_id: nil)
    event_comment.valid?
    expect(event_comment.errors[:event_id]).to include("can't be blank")
  end

end
