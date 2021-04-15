require 'rails_helper'

RSpec.describe "support_requests/index", type: :view do
  before(:each) do
    assign(:support_requests, [
      SupportRequest.create!(
        title: "Title",
        content: "MyText"
      ),
      SupportRequest.create!(
        title: "Title",
        content: "MyText"
      )
    ])
  end

  it "renders a list of support_requests" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
