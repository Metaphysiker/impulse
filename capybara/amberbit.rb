require 'capybara'
session = Capybara::Session.new(:selenium)
session.visit "https://www.philosophie.ch/"

if session.has_content?("Arbeit")
  puts "All shiny, captain!"
else
  puts ":( no tagline fonud, possibly something's broken"
  exit(-1)
end
