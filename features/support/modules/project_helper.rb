# frozen_string_literal: true

# This module contains helper methods to work with Projects
module ProjectHelper
  def visit_projects_page
    @projects_page ||= ProjectsPage.new
    @projects_page.load
    expect(@projects_page.projects_page_title.text).to eql 'Projects'
  end

  def create_project
    @projects_page.add_new_project_icon.click

    @add_project_page = NewProjectPage.new
    expect(@projects_page.projects_page_title.text).to eql 'New project'

    @project = Project.new
    @add_project_page.new_project_name.set @project.name
    @add_project_page.new_project_description.set @project.description
    @add_project_page.new_project_identifier.set @project.identifier
    @add_project_page.new_project_create_btn.click
  end

  def project_add_member(user, role)
    @projects_page.project_add_new_member_link.click
    begin
      i = 0
      check user
    rescue Capybara::ElementNotFound
      @projects_page.project_search_member.set user
      i += 1
      retry unless i == 2
    end
    check role
    @projects_page.project_submit_new_member_btn.click
  end

  def close_project(project_name)
    first(:link, project_name).click
    @projects_page.project_actions_menu.click
    @projects_page.project_close_action.click
    page.driver.browser.switch_to.alert.accept
  end
end

World(ProjectHelper)
