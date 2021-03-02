feature 'Sign up user', js: true do
  user_name = 'test' << Time.now.to_i.to_s
  password = user_name.reverse
  credentials = { :user_name => user_name, :password => password }
  File.open('spec/test_data/creds.yml', 'w') { |file| file.write(credentials.to_yaml) }

  scenario 'User can register' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    find('.register').click

    find('#user_login').set user_name
    find('#user_password').set password
    find('#user_password_confirmation').set password
    find('#user_firstname').set 'Test'
    find('#user_lastname').set 'User'
    find('#user_mail').set "#{user_name}@test.org"

    select 'English', from: 'Language'

    find('input[name="commit"]').click

    expect(page).to have_content 'Logged in as test'
  end
end
