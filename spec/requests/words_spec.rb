require 'rails_helper'

RSpec.describe "Words", type: :request do
  describe "GET /words" do
    it "returns http success" do
      get "/words"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

end
