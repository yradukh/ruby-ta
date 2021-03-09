class MenuSection < SitePrism::Section

  element :sign_in_link, '.login'
  element :sign_up_link, '.register'
  element :logged_as, '#loggedas'

end