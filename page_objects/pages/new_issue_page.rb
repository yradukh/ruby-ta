# frozen_string_literal: true

# This page describes elements on New Issue Page
class NewIssuePage < SitePrism::Page
  set_url 'https://testautomate.me/redmine/projects/laudantium/issues/new'

  element :issue_tracker, '#issue_tracker_id'
  element :issue_subject, '#issue_subject'
  element :issue_description, '#issue_description'
  element :issue_status, '#issue_status_id'
  element :issue_priority, '#issue_priority_id'
  element :issue_assignee, '#issue_assigned_to_id'
  element :issue_create_btn, 'input[value="Create"]'
  element :flare_notice, '#flash_notice'
end
