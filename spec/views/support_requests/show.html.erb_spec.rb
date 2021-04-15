require 'rails_helper'

RSpec.describe "support_requests/show", type: :view do
  before(:each) do
    @support_request = assign(:support_request, SupportRequest.create!(
      title: "Title",
      content: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
