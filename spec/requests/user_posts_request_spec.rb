require 'rails_helper'

RSpec.describe "UserPosts", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/user_posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/user_posts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/user_posts/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/user_posts/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/user_posts/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
