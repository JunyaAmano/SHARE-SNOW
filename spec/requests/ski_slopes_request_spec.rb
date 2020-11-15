require 'rails_helper'

RSpec.describe "SkiSlopes", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/ski_slopes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/ski_slopes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/ski_slopes/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/ski_slopes/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
