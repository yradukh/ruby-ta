# frozen_string_literal: true

class SignUpPage < SitePrism::Page
  set_url 'https://testautomate.me/redmine/account/register'

  section :header, HeaderSection, '#header'
  section :menu, MenuSection, '#top-menu'

  element :login, '#user_login'
  element :password, '#user_password'
  element :password_confirm, '#user_password_confirmation'
  element :first_name, '#user_firstname'
  element :last_name, '#user_lastname'
  element :email, '#user_mail'
  element :user_language, '#user_language'
  element :submit_btn, 'input[name="commit"]'
  element :flash_notice, '#flash_notice'
end
