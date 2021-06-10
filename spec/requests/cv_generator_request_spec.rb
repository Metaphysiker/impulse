require 'rails_helper'

RSpec.describe "CvGenerators", type: :request do

  describe "GET /overview" do
    it "returns http success" do
      get "/cv_generator/overview"
      expect(response).to have_http_status(:success)
    end
  end

end
