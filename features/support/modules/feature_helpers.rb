# frozen_string_literal: true

# This module contains helper methods
module FeatureHelper
  def parse_config_file
    YAML.load_file('./spec/test_data/config.yml')
  end

  def parse_user_data
    YAML.load_file(ENV['CREDS_PATH'])
  end

  def put_creds_to_file(user_name, password, first_name, email, user_role = 'default')
    Dir.mkdir(parse_config_file[:test_data_path]) unless Dir.exist?(parse_config_file[:test_data_path])
    credentials = { user_role => { user_name: user_name, password: password, firstname: first_name, email: email } }
    File.open(ENV['CREDS_PATH'], 'a') { |file| file.write(credentials.to_yaml.gsub("---\n", '')) }
  end

  def sign_up_user(user = nil)
    @sign_up_page = SignUpPage.new
    @sign_up_page.loaded?

    user ||= User.new

    @sign_up_page.login.set user.user_name
    @sign_up_page.password.set user.password
    @sign_up_page.password_confirm.set user.password
    @sign_up_page.first_name.set user.first_name
    @sign_up_page.last_name.set user.last_name
    @sign_up_page.email.set user.email
    @sign_up_page.user_language.select('English')

    @sign_up_page.submit_btn.click

    put_creds_to_file(user.user_name, user.password, user.first_name, user.email, user.user_role)
  end

  def sign_in_user(user_role)
    @sign_in_page = SignInPage.new
    @sign_in_page.load

    credentials = parse_user_data
    @sign_in_page.user_name.set credentials[user_role][:user_name]
    @sign_in_page.password.set credentials[user_role][:password]

    @sign_in_page.login_submit_btn.click
  end
end

World(FeatureHelper)
