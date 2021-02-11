require 'rubygems'
require 'mechanize'
a = Mechanize.new
a.get('https://impulsiv.herokuapp.com/') do |page|

  exchange_page = a.click(page.link_with(:text => /Tauschbörse/))
  #puts exchange_page.body.to_s
  puts exchange_page.uri.to_s

  # Click the login link
  login_page = a.click(page.link_with(:text => /Login/))

  # Submit the login form
  my_page = login_page.form_with(:action => '/users/sign_in') do |f|
    #f.fields.each { |f| puts f.name }
    f["user[email]"]  = "s.raess@me.com"
    f["user[password]"]  = ""
  end.click_button
  #byebug
  #pp login_page

  #puts my_page.body.to_s
  puts my_page.uri.to_s
  my_page.links.each do |link|
    text = link.text.strip
    next unless text.length > 0
    puts text
  end
end
