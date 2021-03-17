require 'rails_helper'

RSpec.describe "cv_units/new", type: :view do
  before(:each) do
    assign(:cv_unit, CvUnit.new(
      category: "MyString",
      name: "MyString",
      content: "MyText"
    ))
  end

  it "renders new cv_unit form" do
    render

    assert_select "form[action=?][method=?]", cv_units_path, "post" do

      assert_select "input[name=?]", "cv_unit[category]"

      assert_select "input[name=?]", "cv_unit[name]"

      assert_select "textarea[name=?]", "cv_unit[content]"
    end
  end
end
