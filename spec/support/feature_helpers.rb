# frozen_string_literal: true

# This module contains helper methods
module FeatureHelper
  def parse_config_file
    YAML.load_file('spec/test_data/config.yml')
  end

  def sign_up_user
    @sign_up_page = SignUpPage.new
    @sign_up_page.loaded?

    @user = User.new

    @sign_up_page.login.set @user.user_name
    @sign_up_page.password.set @user.password
    @sign_up_page.password_confirm.set @user.password
    @sign_up_page.first_name.set @user.first_name
    @sign_up_page.last_name.set @user.last_name
    @sign_up_page.email.set @user.email
    @sign_up_page.user_language.select('English')

    @sign_up_page.submit_btn.click

    Dir.mkdir(parse_config_file[:test_data_path]) unless Dir.exist?(parse_config_file[:test_data_path])
    credentials = { user_name: @user.user_name, password: @user.password }
    File.open(parse_config_file[:creds_path], 'w') { |file| file.write(credentials.to_yaml) }
  end

  def sign_in_user
    @sign_in_page = SignInPage.new

    @sign_in_page.load
    @sign_in_page.loaded?

    credentials = YAML.load_file(parse_config_file[:creds_path])

    @sign_in_page.user_name.set credentials.fetch(:user_name)
    @sign_in_page.password.set credentials.fetch(:password)
    @sign_in_page.login_submit_btn.click
  end
end
