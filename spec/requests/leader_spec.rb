require 'rails_helper'

RSpec.describe "Leaders", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/leader/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/leader/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/leader/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/leader/create"
      expect(response).to have_http_status(:success)
    end
  end

end
