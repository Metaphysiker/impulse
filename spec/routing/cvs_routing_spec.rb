require "rails_helper"

RSpec.describe CvsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cvs").to route_to("cvs#index")
    end

    it "routes to #new" do
      expect(get: "/cvs/new").to route_to("cvs#new")
    end

    it "routes to #show" do
      expect(get: "/cvs/1").to route_to("cvs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cvs/1/edit").to route_to("cvs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cvs").to route_to("cvs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cvs/1").to route_to("cvs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cvs/1").to route_to("cvs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cvs/1").to route_to("cvs#destroy", id: "1")
    end
  end
end
