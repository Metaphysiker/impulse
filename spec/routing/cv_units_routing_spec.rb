require "rails_helper"

RSpec.describe CvUnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cv_units").to route_to("cv_units#index")
    end

    it "routes to #new" do
      expect(get: "/cv_units/new").to route_to("cv_units#new")
    end

    it "routes to #show" do
      expect(get: "/cv_units/1").to route_to("cv_units#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cv_units/1/edit").to route_to("cv_units#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cv_units").to route_to("cv_units#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cv_units/1").to route_to("cv_units#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cv_units/1").to route_to("cv_units#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cv_units/1").to route_to("cv_units#destroy", id: "1")
    end
  end
end
