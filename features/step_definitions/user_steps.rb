When(/^I press "(.*?)"$/) do |register|
  click_button(register)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |box, text|
  fill_in box, with: text
end