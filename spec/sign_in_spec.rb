# frozen_string_literal: true

feature 'Sign in user', js: true do
  target_path = File.read('spec/test_data/creds.yml')
  credentials = YAML.safe_load(target_path, [Symbol])
  user_name = credentials.fetch(:user_name)
  password = credentials.fetch(:password)

  scenario 'User can log in' do
    @sign_in_page = SignInPage.new

    @sign_in_page.load
    expect(@sign_in_page.header.text).to include 'Redmine@testautomate.me'

    @sign_in_page.user_name.set user_name
    @sign_in_page.password.set password
    @sign_in_page.login_submit_btn.click

    @home_page = HomePage.new
    expect(@home_page.menu.logged_as.text).to include "Logged in as #{user_name}"
  end
end
