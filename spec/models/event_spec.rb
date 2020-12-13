require 'rails_helper'

RSpec.describe Event, type: :model do

  it "title, departure_date, return_date, deadline_date, applicant_number, description, user_id, ski_slope_idがあれば有効である" do
    event = Event.new(
      title: "hoge",
      departure_date: 2020-11-23,
      return_date: 2020-11-23,
      deadline_date: 2020-11-23,
      applicant_number: 1,
      description: "hoge",
      user_id: 1,
      ski_slope_id: 1
     )
  end

  it "titleがなければ無効である" do
    event = Event.new(title: nil)
    event.valid?
    expect(event.errors[:title]).to include("can't be blank")
  end

  it "titleが30文字以内である" do
    event = Event.new(title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    event.valid?
    expect(event.errors[:title]).to include("is too long (maximum is 30 characters)")
  end

  it "descriptionがなければ無効である" do
    event = Event.new(description: nil)
    event.valid?
    expect(event.errors[:description]).to include("can't be blank")
  end

  it "descriptionが700文字以内である" do
    event = Event.new(description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    event.valid?
    expect(event.errors[:description]).to include("is too long (maximum is 700 characters)")
  end

  it "applicant_numberがなければ無効である" do
    event = Event.new(applicant_number: nil)
    event.valid?
    expect(event.errors[:applicant_number]).to include("can't be blank")
  end

  it "departure_dateがなければ無効である" do
    event = Event.new(departure_date: nil)
    event.valid?
    expect(event.errors[:departure_date]).to include("can't be blank")
  end

  it "return_dateがなければ無効である" do
    event = Event.new(return_date: nil)
    event.valid?
    expect(event.errors[:return_date]).to include("can't be blank")
  end

  it "deadline_dateがなければ無効である" do
    event = Event.new(deadline_date: nil)
    event.valid?
    expect(event.errors[:deadline_date]).to include("can't be blank")
  end

  it "user_idがなければ無効である" do
    event = Event.new(user_id: nil)
    event.valid?
    expect(event.errors[:user_id]).to include("can't be blank")
  end

  it "ski_slope_idがなければ無効である" do
    event = Event.new(ski_slope_id: nil)
    event.valid?
    expect(event.errors[:ski_slope_id]).to include("can't be blank")
  end


end
