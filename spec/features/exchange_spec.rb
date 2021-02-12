require 'rails_helper'

RSpec.describe "exchange", :type => :feature do

  before(:each) do
    first_user = User.create!(:email => Faker::Internet.email, :password => "secret")
    login_with(first_user)
  end

  it "views the exchange" do

    visit exchange_path

    expect(page).to have_content("Tauschbörse")

  end

end

def login_with(user)
  visit "/users/sign_in"
  fill_in "e-Mail", :with => user.email
  fill_in "Passwort", :with => "secret"
  click_button "Log in"

  #expect(page).to have_selector(".navbar-brand", :text => user.username)
end
