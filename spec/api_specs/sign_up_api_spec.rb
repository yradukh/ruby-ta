# frozen_string_literal: true

feature 'Sign up user via API', js: true do
  scenario 'User can register via API' do
    @home_page = HomePage.new

    @home_page.load
    expect(@home_page.page_title.text).to eql 'Home'

    user = User.new
    api_create_user_rs(user)

    put_creds_to_file_rs(user.user_name, user.password)
  end
end
