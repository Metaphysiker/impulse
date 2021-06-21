require 'rails_helper'

RSpec.describe "cvs/index", type: :view do
  before(:each) do
    assign(:cvs, [
      Cv.create!(
        name: "Name"
      ),
      Cv.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of cvs" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
