require 'rails_helper'

RSpec.describe "cv_units/show", type: :view do
  before(:each) do
    @cv_unit = assign(:cv_unit, CvUnit.create!(
      category: "Category",
      name: "Name",
      content: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
