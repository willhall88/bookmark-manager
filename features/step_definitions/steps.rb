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