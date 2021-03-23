# frozen_string_literal: true

class MenuSection < SitePrism::Section
  element :sign_in_link, '.login'
  element :sign_up_link, '.register'
  element :logged_as, '#loggedas'
  element :home_page_link, '.home'
  element :my_page_link, '.my-page'
  element :projects_page_link, '.projects'
  element :help_page_link, '.projects'
  element :help_page_link, '.projects'
  element :my_account_link, '.my-account'
  element :logout_link, '.logout'
end
