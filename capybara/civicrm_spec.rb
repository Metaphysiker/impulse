#require 'capybara/rails'
require 'capybara/rspec'

describe "the signin process", type: :feature, js: true do

  it "signs me in" do
    visit 'https://crm.impulse.swiss/user'
    within("#user-login") do
      fill_in 'Benutzername', with: 'sara'
      fill_in 'Passwort', with: 'sara1mpulze_BS253'
    end
    click_button 'Anmelden'
    expect(page).to have_content 'Fohrenbühlstrasse 4'
    #expect(page).to_not have_content 'Fohrenbühlstrasse 4'
  end
end
