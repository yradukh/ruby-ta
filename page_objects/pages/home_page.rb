# frozen_string_literal: true

class HomePage < SitePrism::Page
  set_url 'http://testautomate.me/redmine/'

  section :header, HeaderSection, '#header'
  section :menu, MenuSection, '#top-menu'

  element :page_title, '#content > h2'
end
