require 'rails_helper'

RSpec.describe UserPostComment, type: :model do
  it "comment, user_id, user_post_idがあれば有効である" do
    user_post_comment = UserPostComment.new(
      comment: "hoge",
      user_id: 1,
      user_post_id: 1
     )
  end

  it "commentがなければ無効である" do
    user_post_comment = UserPostComment.new(comment: nil)
    user_post_comment.valid?
    expect(user_post_comment.errors[:comment]).to include("can't be blank")
  end

  it "commentが200文字以内である" do
    user_post_comment = UserPostComment.new(comment: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    user_post_comment.valid?
    expect(user_post_comment.errors[:comment]).to include("is too long (maximum is 200 characters)")
  end

  it "user_idがなければ無効である" do
    user_post_comment = UserPostComment.new(user_id: nil)
    user_post_comment.valid?
    expect(user_post_comment.errors[:user_id]).to include("can't be blank")
  end

  it "user_post_idがなければ無効である" do
    user_post_comment = UserPostComment.new(user_post_id: nil)
    user_post_comment.valid?
    expect(user_post_comment.errors[:user_post_id]).to include("can't be blank")
  end
  
end