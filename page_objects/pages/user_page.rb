# frozen_string_literal: true

# This page describes elements on user page
class UserPage < SitePrism::Page
  set_url 'https://testautomate.me/redmine/my/page'

  section :header, HeaderSection, '#header'
  section :menu, MenuSection, '#top-menu'

  element :my_page_title, '#content h2'
  element :no_assigned_issues, '#block-issuesassignedtome .nodata'
  element :no_reported_issues, '#block-issuesreportedbyme .nodata'
end
