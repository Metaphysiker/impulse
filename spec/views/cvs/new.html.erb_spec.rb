require 'rails_helper'

RSpec.describe "cvs/new", type: :view do
  before(:each) do
    assign(:cv, Cv.new(
      name: "MyString"
    ))
  end

  it "renders new cv form" do
    render

    assert_select "form[action=?][method=?]", cvs_path, "post" do

      assert_select "input[name=?]", "cv[name]"
    end
  end
end
