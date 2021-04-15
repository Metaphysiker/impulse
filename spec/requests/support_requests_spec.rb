 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/support_requests", type: :request do
  # SupportRequest. As you add validations to SupportRequest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      SupportRequest.create! valid_attributes
      get support_requests_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      support_request = SupportRequest.create! valid_attributes
      get support_request_url(support_request)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_support_request_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      support_request = SupportRequest.create! valid_attributes
      get edit_support_request_url(support_request)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new SupportRequest" do
        expect {
          post support_requests_url, params: { support_request: valid_attributes }
        }.to change(SupportRequest, :count).by(1)
      end

      it "redirects to the created support_request" do
        post support_requests_url, params: { support_request: valid_attributes }
        expect(response).to redirect_to(support_request_url(SupportRequest.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new SupportRequest" do
        expect {
          post support_requests_url, params: { support_request: invalid_attributes }
        }.to change(SupportRequest, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post support_requests_url, params: { support_request: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested support_request" do
        support_request = SupportRequest.create! valid_attributes
        patch support_request_url(support_request), params: { support_request: new_attributes }
        support_request.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the support_request" do
        support_request = SupportRequest.create! valid_attributes
        patch support_request_url(support_request), params: { support_request: new_attributes }
        support_request.reload
        expect(response).to redirect_to(support_request_url(support_request))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        support_request = SupportRequest.create! valid_attributes
        patch support_request_url(support_request), params: { support_request: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested support_request" do
      support_request = SupportRequest.create! valid_attributes
      expect {
        delete support_request_url(support_request)
      }.to change(SupportRequest, :count).by(-1)
    end

    it "redirects to the support_requests list" do
      support_request = SupportRequest.create! valid_attributes
      delete support_request_url(support_request)
      expect(response).to redirect_to(support_requests_url)
    end
  end
end
