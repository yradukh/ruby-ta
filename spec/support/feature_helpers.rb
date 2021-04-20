# frozen_string_literal: true

# This module contains helper methods
module FeatureHelperRS
  def parse_config_file_rs
    YAML.load_file('spec/test_data/config.yml')
  end

  def put_creds_to_file_rs(user_name, password)
    Dir.mkdir(parse_config_file_rs[:test_data_path]) unless Dir.exist?(parse_config_file_rs[:test_data_path])
    credentials = { user_name: user_name, password: password }
    File.open(ENV['CREDS_PATH'], 'w') { |file| file.write(credentials.to_yaml) }
  end

  def sign_up_user_rs
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

    put_creds_to_file_rs(@user.user_name, @user.password)
  end

  def sign_in_user_rs
    @sign_in_page = SignInPage.new

    @sign_in_page.load
    @sign_in_page.loaded?

    credentials = YAML.load_file(ENV['CREDS_PATH'])

    @sign_in_page.user_name.set credentials.fetch(:user_name)
    @sign_in_page.password.set credentials.fetch(:password)
    @sign_in_page.login_submit_btn.click
  end

  def create_project_rs
    @add_project_page = NewProjectPage.new
    expect(@projects_page.projects_page_title.text).to eql 'New project'

    @project = Project.new
    @add_project_page.new_project_name.set @project.name
    @add_project_page.new_project_description.set @project.description
    @add_project_page.new_project_identifier.set @project.identifier
    @add_project_page.new_project_create_btn.click
    expect(@add_project_page.flare_notice.text).to eql 'Successful creation.'
  end
end
