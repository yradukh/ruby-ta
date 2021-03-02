feature 'Sign in user', js: true do
  credentials = YAML.load(File.read('spec/test_data/creds.yml'))
  user_name = credentials.fetch(:user_name)
  password = credentials.fetch(:password)
  scenario 'User can log in' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    find('.login').click

    find('#username').set user_name
    find('#password').set password
    find('#login-submit').click

    expect(page).to have_content 'Logged in as ' << user_name
  end
end