require 'cucumber'
require 'watir'

Given('I try to log in to EGI Check-In') do
  @browser = Watir::Browser.new :firefox
  @browser.goto('https://aai.egi.eu')
  @browser.span(text: /login/i).click
end

Then('I click on the red log in button on the top right') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I am taken to the IdP Proxy') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I can see the ORCID option to log in.') do
  pending # Write code here that turns the phrase above into concrete actions
end

After do
  @browser.close
end
