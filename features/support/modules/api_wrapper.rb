# frozen_string_literal: true

require 'rest-client'

# This module contains API invoke methods
module ApiWrapper
  def api_create_user(user)
    response = RestClient.post "#{parse_config_file[:root_url]}users.json",
                               {
                                 "user": {
                                   "login": user.user_name,
                                   "password": user.password,
                                   "firstname": user.first_name,
                                   "lastname": user.last_name,
                                   "mail": user.email
                                 }
                               }.to_json,
                               api_headers

    raise 'User was not created via API' unless response.code == 201

    put_creds_to_file(user.user_name, user.password, user.first_name, user.email, user.user_role)
  end

  def api_create_project(project)
    response = RestClient.post "#{parse_config_file[:root_url]}projects.json",
                               {
                                 "project": {
                                   "name": project.name,
                                   "identifier": project.identifier,
                                   "description": project.description
                                 }
                               }.to_json,
                               api_headers

    raise 'Project was not created via API' unless response.code == 201
  end

  def api_check_project_created(project)
    response = RestClient.get("#{parse_config_file[:root_url]}projects/#{project}.json", api_headers)

    raise 'Project was not created via API' unless response.code == 200
  end

  def api_headers
    { content_type: :json, 'x-redmine-api-key': ENV['API_KEY'] }
  end
end

World(ApiWrapper)
