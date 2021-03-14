# frozen_string_literal: true

class SignInPage < SitePrism::Page
  set_url 'http://testautomate.me/redmine/login'

  section :header, HeaderSection, '#header'
  section :menu, MenuSection, '#top-menu'

  element :user_name, '#username'
  element :password, '#password'
  element :lost_password_link, '.lost_password'
  element :login_submit_btn, '#login-submit'
end
