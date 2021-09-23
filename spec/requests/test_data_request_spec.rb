require 'rails_helper'

RSpec.describe "TestData", type: :request do

  describe "GET /cv_units" do
    it "returns http success" do
      get "/test_data/cv_units"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users" do
    it "returns http success" do
      get "/test_data/users"
      expect(response).to have_http_status(:success)
    end
  end

end
