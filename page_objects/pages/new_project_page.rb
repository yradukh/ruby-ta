# frozen_string_literal: true

# This class describes elements on New Project creation page
class NewProjectPage < SitePrism::Page
  set_url 'https://testautomate.me/redmine/projects/new'

  element :new_projects_page_title, '#content h2'

  # New Project creation
  element :new_project_name, '#project_name'
  element :new_project_description, '#project_description'
  element :new_project_identifier, '#project_identifier'
  element :new_project_create_btn, 'input[name="commit"]'
  element :flare_notice, '#flash_notice'
end
