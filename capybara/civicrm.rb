require 'capybara'
require 'io/console'
session = Capybara::Session.new(:selenium)
session.visit "https://crm.impulse.swiss/user"

puts "Benutzername: "
benutzername = gets.chomp
puts "Passwort: "
passwort = STDIN.noecho(&:gets).chomp

session.within("#user-login") do
  session.fill_in 'Benutzername', with: benutzername
  session.fill_in 'Passwort', with: passwort
end
session.click_button 'Anmelden'
if session.has_content?("Fohrenbühlstrasse 4")
  puts "Logged in"
else
  abort("Login failed")
end
#session.expect(page).to have_content 'Fohrenbühlstrasse 4'

session.click_link('CiviCRM')

abort("Not in CiviCRM Home") unless session.has_content?("CiviCRM Home")
puts "In CiviCRM Home"
#if session.has_content?("Arbeit")
#  puts "All shiny, captain!"
#else
#  puts ":( no tagline fonud, possibly something's broken"
#  exit(-1)
#end
