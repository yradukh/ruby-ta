# frozen_string_literal: true

Given('I visit Redmine homepage') do
  @home_page = HomePage.new

  @home_page.load
  expect(@home_page.page_title.text).to eql 'Home'
end

When(/^I click click '([^"]*)' button$/) do |button|
  case button
  when 'login'
    @home_page.menu.sign_in_link.click
  when 'register'
    @home_page.menu.sign_up_link.click
  else
    raise 'Incorrect button defined'
  end
end

When(/^I fill in '([^"]*)' form$/) do |form|
  case form
  when 'login'
    sign_in_user('default')
  when 'registration'
    sign_up_user
  else
    raise 'Incorrect form defined'
  end
end

Then(/^I see that I become '([^"]*)' in user$/) do |type|
  case type
  when 'logged'
    expect(@sign_in_page.menu.my_account_link.visible?).to eql true
  when 'registered'
    expect(@sign_up_page.flash_notice.text).to include 'Your account has been activated.'
  else
    raise 'Incorrect login type defined'
  end
end
