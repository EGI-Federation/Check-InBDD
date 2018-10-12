require 'cucumber'
require 'watir'

visbile_link_script = %q{
  var rect = arguments[0].getBoundingClientRect(); 
  return (
    rect.top >= 0 &&
    rect.left >= 0 &&
    rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
    rect.right <= (window.innerWidth || document.documentElement.clientWidth) );
}

Given('I try to log in to EGI Check-In') do
  @browser = Watir::Browser.new :firefox
  @browser.goto('https://aai.egi.eu')
end

Then('I click on the red log in button on the top right') do
  @browser.span(text: /login/i).click
end

Then('I am taken to the IdP Proxy') do
  expect(@browser.url).to match(%r{aai\.egi\.eu/proxy/module\.php/discopower/disco.php\?entityID=https%3A%2F%2Faai\.egi\.eu})
end

Then('I can see the ORCID option to log in.') do
  @orcid_link = @browser.link(class: 'orcid', text: /orcid/i)
  expect(@orcid_link.present?).to be
  @browser.div(id: 'loader').wait_while(&:present?)
  expect(@browser.execute_script(visbile_link_script, @orcid_link)).to be_truthy
end

After do
  @browser.close
end
