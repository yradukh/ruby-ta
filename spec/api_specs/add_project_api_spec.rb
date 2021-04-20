# frozen_string_literal: true

feature 'Sign up user via API', js: true do
  scenario 'User can register via API' do
    sign_in_user_rs

    project = Project.new
    api_create_project_rs(project)

    @projects_page = ProjectsPage.new
    @projects_page.load

    expect(@projects_page).to have_content project.name.to_s
  end
end
