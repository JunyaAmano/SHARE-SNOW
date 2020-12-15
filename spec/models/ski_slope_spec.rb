require 'rails_helper'

RSpec.describe SkiSlope, type: :model do
  it "titleがあれば有効である" do
    title = SkiSlope.new(
      title: "hoge",
     )
  end

  it "titleがなければ無効である" do
    title = SkiSlope.new(title: nil)
    title.valid?
    expect(title.errors[:title]).to include("can't be blank")
  end

  it "titleが20文字以内である" do
    title = SkiSlope.new(title: "aaaaaaaaaaaaaaaaaaaaa")
    title.valid?
    expect(title.errors[:title]).to include("is too long (maximum is 20 characters)")
  end

end
