# frozen_string_literal: true

feature 'Check user Projects page', js: true do
  scenario 'User is able to add new project' do
    sign_in_user_rs
    @sign_in_page.menu.projects_page_link.click

    @projects_page = ProjectsPage.new
    expect(@projects_page.projects_page_title.text).to eql 'Projects'
    @projects_page.add_new_project_icon.click

    @add_project_page = NewProjectPage.new
    expect(@projects_page.projects_page_title.text).to eql 'New project'

    create_project_rs
  end
end
