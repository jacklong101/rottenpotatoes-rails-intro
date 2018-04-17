require 'rubygems'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'cucumber'

#$DEBUG = true
#driver = Selenium::WebDriver.for :chrome
driver = Selenium::WebDriver::Remote::Capabilities.new
#driver = Watir::Browser.new :firefox

When ("I go to google") do 
    #driver.get "http://google.com"
    driver.navigate.to "google.com"
    #driver.goto "www.google.com"
end

And ("I search for cheese") do
    element = driver.find_element :name => "q"
    element.send_keys "Cheese!"
    element.submit
end

Then ("I should see cheese") do 
    puts "Page title is #{driver.title}"
    
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { driver.title.downcase.start_with? "cheese!" }
    
    puts "Page title is #{driver.title}"
end

driver.quit

check = 0
#When ("I add {int} and {int}") do |one, two|
When(/^I add (\d+) and (\d+)$/) do |one, two|
  check = one + two
end

#Then ("I should see {int}") do |input|
When(/^I should see (\d+)$/) do |input|
  check == input
end