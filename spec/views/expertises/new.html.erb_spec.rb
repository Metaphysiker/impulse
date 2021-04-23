require 'rails_helper'

RSpec.describe "expertises/new", type: :view do
  before(:each) do
    assign(:expertise, Expertise.new(
      title: "MyString",
      description: "MyText",
      content: "MyText"
    ))
  end

  it "renders new expertise form" do
    render

    assert_select "form[action=?][method=?]", expertises_path, "post" do

      assert_select "input[name=?]", "expertise[title]"

      assert_select "textarea[name=?]", "expertise[description]"

      assert_select "textarea[name=?]", "expertise[content]"
    end
  end
end
