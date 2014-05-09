Given(/^I am on the homepage$/) do
  visit ('/')
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

When(/^I fill in the "(.*?)" with "(.*?)"$/) do |box, text|
  fill_in box, with: text
end

When(/^I click "(.*?)"$/) do |add|
  find_button(add).click
end

Then(/^I should see "(.*?)" in a link$/) do |text|
  page.should have_link text
end
  
Before do
  Link.create(:title => "Makers Academy", 
                :url => "http://www.makersacademy.com/",
                :tags => [Tag.first_or_create(:name =>"search")])
  Link.create(:title => "Google", 
                :url => "http://www.google.com/",
                :tags => [Tag.first_or_create(:name => "school")])
  Link.create(:title => "Bing", 
                :url => "http://www.bing.com/",
                :tags => [Tag.first_or_create(:name => "school")])
end

Given(/^I have three links and two of the links with the tag 'search'$/) do
  visit('/')
end

When(/^I press the "(.*?)" tag$/) do |tag|
  click_button(tag)
end

Then(/^I should see a page with only the links associated with that tag$/) do
  page.should have_link "Google"
  page.should have_link "Bing"
end