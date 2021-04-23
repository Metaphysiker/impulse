require 'rails_helper'

RSpec.describe "expertises/edit", type: :view do
  before(:each) do
    @expertise = assign(:expertise, Expertise.create!(
      title: "MyString",
      description: "MyText",
      content: "MyText"
    ))
  end

  it "renders the edit expertise form" do
    render

    assert_select "form[action=?][method=?]", expertise_path(@expertise), "post" do

      assert_select "input[name=?]", "expertise[title]"

      assert_select "textarea[name=?]", "expertise[description]"

      assert_select "textarea[name=?]", "expertise[content]"
    end
  end
end
