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

RSpec.describe "/cv_units", type: :request do
  # CvUnit. As you add validations to CvUnit, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      CvUnit.create! valid_attributes
      get cv_units_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      cv_unit = CvUnit.create! valid_attributes
      get cv_unit_url(cv_unit)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_cv_unit_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      cv_unit = CvUnit.create! valid_attributes
      get edit_cv_unit_url(cv_unit)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CvUnit" do
        expect {
          post cv_units_url, params: { cv_unit: valid_attributes }
        }.to change(CvUnit, :count).by(1)
      end

      it "redirects to the created cv_unit" do
        post cv_units_url, params: { cv_unit: valid_attributes }
        expect(response).to redirect_to(cv_unit_url(CvUnit.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CvUnit" do
        expect {
          post cv_units_url, params: { cv_unit: invalid_attributes }
        }.to change(CvUnit, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post cv_units_url, params: { cv_unit: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested cv_unit" do
        cv_unit = CvUnit.create! valid_attributes
        patch cv_unit_url(cv_unit), params: { cv_unit: new_attributes }
        cv_unit.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the cv_unit" do
        cv_unit = CvUnit.create! valid_attributes
        patch cv_unit_url(cv_unit), params: { cv_unit: new_attributes }
        cv_unit.reload
        expect(response).to redirect_to(cv_unit_url(cv_unit))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        cv_unit = CvUnit.create! valid_attributes
        patch cv_unit_url(cv_unit), params: { cv_unit: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cv_unit" do
      cv_unit = CvUnit.create! valid_attributes
      expect {
        delete cv_unit_url(cv_unit)
      }.to change(CvUnit, :count).by(-1)
    end

    it "redirects to the cv_units list" do
      cv_unit = CvUnit.create! valid_attributes
      delete cv_unit_url(cv_unit)
      expect(response).to redirect_to(cv_units_url)
    end
  end
end
