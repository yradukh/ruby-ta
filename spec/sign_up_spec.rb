# frozen_string_literal: true

feature 'Sign up user', js: true do
  test_data_path = 'spec/test_data/'
  Dir.mkdir(test_data_path) unless Dir.exist?(test_data_path)
  user_name = SecureRandom.alphanumeric
  password = SecureRandom.hex
  credentials = { user_name: user_name, password: password }
  File.open("#{test_data_path}creds.yml", 'w') { |file| file.write(credentials.to_yaml) }

  scenario 'User can register' do
    @home_page = HomePage.new

    @home_page.load
    @home_page.menu.sign_up_link.click
    expect(@home_page.header.text).to include 'Redmine@testautomate.me'

    @sign_up_page = SignUpPage.new
    @sign_up_page.loaded?

    @sign_up_page.login.set user_name
    @sign_up_page.password.set password
    @sign_up_page.password_confirm.set password
    @sign_up_page.first_name.set 'Test'
    @sign_up_page.last_name.set 'User'
    @sign_up_page.email.set "#{user_name}@test.org"
    @sign_up_page.user_language.select('English')

    @sign_up_page.submit_btn.click

    expect(@sign_up_page.menu.logged_as.text).to include "Logged in as #{user_name}"
  end
end
