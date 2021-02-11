require 'rubygems'
require 'mechanize'

abort "You need 2 arguments: email password" if (ARGV.size != 2)

a = Mechanize.new
a.get('https://crm.impulse.swiss/user') do |page|

  #exchange_page = a.click(page.link_with(:text => /Tauschbörse/))
  #puts exchange_page.body.to_s
  #puts exchange_page.uri.to_s

  # Click the login link
  #login_page = a.click(page.link_with(:text => /user-login/))

  # Submit the login form
  start_page = page.form_with(:action => '/user') do |f|
    f.fields.each { |f| puts f.name }
    f["name"]  = ARGV[0]
    f["pass"]  = ARGV[1]
  end.click_button

  abort "e-mail or password not valid" if start_page.body.force_encoding(Encoding::UTF_8).include?("nicht akzeptiert")
  #byebug
  #pp login_page

  civicrm_dashboard = a.click(start_page.link_with(:text => /CiviCRM/))

  #puts my_page.body.to_s
  puts civicrm_dashboard.uri.to_s
  civicrm_dashboard.links.each do |link|
    text = link.text.strip
    next unless text.length > 0
    puts text
  end
end

exit(true)
