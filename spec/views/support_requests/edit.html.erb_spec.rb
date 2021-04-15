require 'rails_helper'

RSpec.describe "support_requests/edit", type: :view do
  before(:each) do
    @support_request = assign(:support_request, SupportRequest.create!(
      title: "MyString",
      content: "MyText"
    ))
  end

  it "renders the edit support_request form" do
    render

    assert_select "form[action=?][method=?]", support_request_path(@support_request), "post" do

      assert_select "input[name=?]", "support_request[title]"

      assert_select "textarea[name=?]", "support_request[content]"
    end
  end
end
