require 'rails_helper'

RSpec.describe UserPost, type: :model do
  it "content, user_idがあれば有効である" do
    user_post = UserPost.new(
      content: "hoge",
      user_id: 1,
     )
  end

  it "contentがなければ無効である" do
    user_post = UserPost.new(content: nil)
    user_post.valid?
    expect(user_post.errors[:content]).to include("can't be blank")
  end

  it "contentが200文字以内である" do
    user_post = UserPost.new(content: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    user_post.valid?
    expect(user_post.errors[:content]).to include("is too long (maximum is 200 characters)")
  end

  it "user_idがなければ無効である" do
    user_post = UserPost.new(user_id: nil)
    user_post.valid?
    expect(user_post.errors[:user_id]).to include("can't be blank")
  end

end
