require "rails_helper"

RSpec.describe ExpertisesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/expertises").to route_to("expertises#index")
    end

    it "routes to #new" do
      expect(get: "/expertises/new").to route_to("expertises#new")
    end

    it "routes to #show" do
      expect(get: "/expertises/1").to route_to("expertises#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/expertises/1/edit").to route_to("expertises#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/expertises").to route_to("expertises#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/expertises/1").to route_to("expertises#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/expertises/1").to route_to("expertises#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/expertises/1").to route_to("expertises#destroy", id: "1")
    end
  end
end
