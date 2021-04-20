# frozen_string_literal: true

feature 'Check user page', js: true do
  scenario 'User has no assigned and reported issues' do
    sign_in_user_rs
    @sign_in_page.menu.my_page_link.click

    @user_page = UserPage.new
    @user_page.loaded?

    expect(@user_page.my_page_title.text).to eql 'My page'
    expect(@user_page.no_assigned_issues.visible?).to eql true
    expect(@user_page.no_reported_issues.visible?).to eql true
  end
end
