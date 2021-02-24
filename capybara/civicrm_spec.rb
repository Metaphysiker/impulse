#require 'capybara/rails'
require 'capybara/rspec'

describe "the signin process", type: :feature, js: true do

  before(:each) do
    puts "before each"
  end

  after(:each) do
    puts "after each"
    if Capybara.app
      pid = Capybara.current_session.driver.instance_variable_get("@options")[:server].pid
      Process.kill('TERM', pid)
    end
  end

  it "signs me in" do
    visit 'https://crm.impulse.swiss/user'
    within("#user-login") do
      fill_in 'Benutzername', with: ''
      fill_in 'Passwort', with: ''
    end
    click_button 'Anmelden'
    expect(page).to have_content 'Fohrenbühlstrasse 4'
    #expect(page).to_not have_content 'Fohrenbühlstrasse 4'
  end
end
