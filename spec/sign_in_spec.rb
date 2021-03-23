# frozen_string_literal: true

feature 'Sign in user', js: true do
  scenario 'User can log in' do
    sign_in_user

    expect(@sign_in_page.menu.my_account_link.visible?).to eql true
  end
end
