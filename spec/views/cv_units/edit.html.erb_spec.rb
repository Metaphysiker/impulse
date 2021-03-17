require 'rails_helper'

RSpec.describe "cv_units/edit", type: :view do
  before(:each) do
    @cv_unit = assign(:cv_unit, CvUnit.create!(
      category: "MyString",
      name: "MyString",
      content: "MyText"
    ))
  end

  it "renders the edit cv_unit form" do
    render

    assert_select "form[action=?][method=?]", cv_unit_path(@cv_unit), "post" do

      assert_select "input[name=?]", "cv_unit[category]"

      assert_select "input[name=?]", "cv_unit[name]"

      assert_select "textarea[name=?]", "cv_unit[content]"
    end
  end
end
