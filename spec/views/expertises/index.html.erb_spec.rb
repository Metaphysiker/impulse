require 'rails_helper'

RSpec.describe "expertises/index", type: :view do
  before(:each) do
    assign(:expertises, [
      Expertise.create!(
        title: "Title",
        description: "MyText",
        content: "MyText"
      ),
      Expertise.create!(
        title: "Title",
        description: "MyText",
        content: "MyText"
      )
    ])
  end

  it "renders a list of expertises" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
