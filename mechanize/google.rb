require 'rubygems'
require 'mechanize'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

a.get('https://impulsiv.herokuapp.com/') do |page|
  # Click the login link
  login_page = a.click(page.link_with(:text => /Login/))

  # Submit the login form
  my_page = login_page.form_with(:action => '/users/sign_in') do |f|
    #f.fields.each { |f| puts f.name }
    f["email"]  = "s.raess@me.com"
    f["password"]  = "abcdef"
  end.click_button
end
