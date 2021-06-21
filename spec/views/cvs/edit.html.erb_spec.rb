require 'rails_helper'

RSpec.describe "cvs/edit", type: :view do
  before(:each) do
    @cv = assign(:cv, Cv.create!(
      name: "MyString"
    ))
  end

  it "renders the edit cv form" do
    render

    assert_select "form[action=?][method=?]", cv_path(@cv), "post" do

      assert_select "input[name=?]", "cv[name]"
    end
  end
end
