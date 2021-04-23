require 'rails_helper'

RSpec.describe "expertises/show", type: :view do
  before(:each) do
    @expertise = assign(:expertise, Expertise.create!(
      title: "Title",
      description: "MyText",
      content: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
