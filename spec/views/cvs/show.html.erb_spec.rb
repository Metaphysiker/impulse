require 'rails_helper'

RSpec.describe "cvs/show", type: :view do
  before(:each) do
    @cv = assign(:cv, Cv.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
