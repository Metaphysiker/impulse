require 'rails_helper'

RSpec.describe "cv_units/index", type: :view do
  before(:each) do
    assign(:cv_units, [
      CvUnit.create!(
        category: "Category",
        name: "Name",
        content: "MyText"
      ),
      CvUnit.create!(
        category: "Category",
        name: "Name",
        content: "MyText"
      )
    ])
  end

  it "renders a list of cv_units" do
    render
    assert_select "tr>td", text: "Category".to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
