class HomePage < SitePrism::Page

  set_url 'http://testautomate.me/redmine/'

  section :header, HeaderSection,'#header'
  section :menu, MenuSection, '#top-menu'

end