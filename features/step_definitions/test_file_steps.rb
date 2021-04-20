# frozen_string_literal: true

Given('I am not logged in visitor') do
  @home_page = HomePage.new
  @home_page.load

  expect(@home_page.page_title.text).to eql 'Home'
end

When(/^I register '([^"]*)' user via Redmine '([^"]*)'$/) do |user_role, type|
  current_user = User.new user_role
  case type
  when 'API'
    api_create_user(current_user)
  when 'UI'
    @home_page.menu.sign_up_link.click
    sign_up_user(current_user)
  else
    raise 'No register type defined'
  end
end

Then(/^I see the '([^"]*)' user is registered$/) do |current_user|
  expect(parse_user_data.key?(current_user)).to eql true
end

Then(/^I become logged in as '([^"]*)' user$/) do |current_user|
  expect(@home_page.menu.logged_as.text).to eql "Logged in as #{parse_user_data[current_user][:user_name]}"
end

When('I create a project') do
  visit_projects_page

  create_project
end

Then(/^I see that project is created on '([^"]*)' level$/) do |type|
  case type
  when 'API'
    api_check_project_created(@project.identifier)
  when 'UI'
    expect(@add_project_page.flare_notice.text).to eql 'Successful creation.'
  else
    raise 'Incorrect level defined'
  end
end

When(/^I add '([^"]*)' user as a member of the project$/) do |user_role|
  visit_projects_page
  first("a[href$='#{@project.identifier}']").click

  @projects_page.project_settings_tab.click
  @projects_page.settings_members_tab.click
  project_add_member(parse_user_data[user_role][:firstname], 'Developer')
end

Then(/^I can can see '([^"]*)' user in the project member list$/) do |user_role|
  expect(@projects_page.settings_members_list).to have_content parse_user_data[user_role][:firstname]
end

When(/^I create an issue and assign '([^"]*)' user to created issue$/) do |user_role|
  first("a[href$='#{@project.identifier}']").click

  @projects_page.project_settings_tab.click
  issue_add_tracker('Bug')

  @projects_page.project_issues_tab.click

  create_issue('Bug', 'Test Redmine issue', 'New', 'High', parse_user_data[user_role][:firstname])

  expect(@new_issue_page.flare_notice.text).to include ' created.'
end

Then(/^I see the issue is created$/) do
  @projects_page.project_issues_tab.click
  expect(@projects_page.issue_subject.visible?).to eql true
end

And(/^I see '([^"]*)' user is assigned to the issue$/) do |user_role|
  expect(@projects_page.issue_assignee.text).to eql parse_user_data[user_role][:firstname]
end

When(/^I logout$/) do
  @home_page.menu.logout_link.click
end

When(/^I login as '([^"]*)' user$/) do |user_role|
  sign_in_user(user_role)
end

When(/^I track time for the assigned issue$/) do
  visit_projects_page

  @projects_page.project_issues_tab.click
  first(:link, 'Test Redmine issue').click

  issue_log_time(1, 'Development')
end

Then(/^I see the time is tracked properly$/) do
  expect(@projects_page.project_issue_spent_time.text).to eql '1.00 h'
end

When(/^I close the issue$/) do
  visit_projects_page

  @projects_page.project_issues_tab.click
  first(:link, 'Test Redmine issue').click

  close_issue
end

Then(/^I see the issue was closed$/) do
  expect(@projects_page.project_issue_status.text).to eql 'Closed'
end

When(/^I close the project$/) do
  visit_projects_page

  close_project(@project.name)
end

Then(/^I see it was successfully closed$/) do
  expect(@projects_page.project_closed_message.text).to eql 'This project is closed and read-only.'
end
