# frozen_string_literal: true

feature 'Sign up user', js: true do
  scenario 'User can register' do
    @home_page = HomePage.new

    @home_page.load
    expect(@home_page.page_title.text).to eql 'Home'
    @home_page.menu.sign_up_link.click

    sign_up_user
    expect(@sign_up_page.menu.logged_as.text).to include "Logged in as #{@user.user_name}"
  end
end
