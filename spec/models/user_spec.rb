require 'rails_helper'

RSpec.describe User, type: :model do
  it "name, email, password, age, is_owned, gender, riding_style, introductionがあれば有効である," do
    user = User.new(
      name: "hoge",
      email: "hoge@hoge.com",
      password: "999999",
      age: 30,
      is_owned: false,
      gender: 1,
      riding_style: 1,
      introduction: "初めまして"
     )
  end

  it "nameがなければ無効である" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "emailがなければ無効である" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "passwordがなければ無効である" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "ageがなければ無効である" do
    user = User.new(age: nil)
    user.valid?
    expect(user.errors[:age]).to include("can't be blank")
  end

  it "genderがなければ無効である" do
    user = User.new(gender: nil)
    user.valid?
    expect(user.errors[:gender]).to include("can't be blank")
  end

  it "riding_styleがなければ無効である" do
    user = User.new(riding_style: nil)
    user.valid?
    expect(user.errors[:riding_style]).to include("can't be blank")
  end

  it "introductionが200文字以内である" do
    user = User.new(introduction: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    user.valid?
    expect(user.errors[:introduction]).to include("is too long (maximum is 200 characters)")
  end

  it "重複したメールアドレスは無効である" do
    User.create(
      name: "hoge",
      email: "hoge@hoge.com",
      password: "999999",
      age: 30,
      is_owned: false,
      gender: 1,
      riding_style: 1,
      introduction: "初めまして"
     )
    user = User.new(
      name: "hoge",
      email: "hoge@hoge.com",
      password: "999999",
      age: 30,
      is_owned: false,
      gender: 1,
      riding_style: 1,
      introduction: "初めまして"
     )
     user.valid?
     expect(user.errors[:email]).to include("has already been taken")
   end
end
