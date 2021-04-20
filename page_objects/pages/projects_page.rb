# frozen_string_literal: true

# This class describes elements on Projects Page
class ProjectsPage < SitePrism::Page
  set_url 'https://testautomate.me/redmine/projects'

  section :menu, MenuSection, '#top-menu'

  element :projects_page_title, '#content h2'
  element :project_name, 'a.my-project'
  element :add_new_project_icon, '.icon.icon-add'

  # Project Actions menu
  element :project_actions_menu, 'span.drdn'
  element :project_close_action, 'a.icon-lock'
  element :project_closed_message, 'p.warning'

  # Project 'Settings' tab
  element :project_settings_tab, '.settings'

  # 'Settings' -> 'Members' tab
  element :settings_members_tab, '#tab-members'
  element :settings_members_list, '.list.members'
  element :project_add_new_member_link, '.icon.icon-add'
  element :project_search_member, '#principal_search'
  element :project_set_new_member_role, '.roles-selection input'
  element :project_submit_new_member_btn, '#member-add-submit'

  # 'Settings' -> 'Issue tracking' tab
  element :settings_issue_tracking_tab, '#tab-issues'
  element :tracking_issue_type, '#project_trackers input'
  element :tracking_issue_save_btn, '#tab-content-issues input[value="Save"]'

  # Project 'Issues' tab
  element :project_issues_tab, '.issues'
  element :issue_subject, 'td.subject a'
  element :issue_assignee, 'td.assigned_to'
  element :add_new_issue_link, '.icon.icon-add.new-issue'

  # Project 'Spent time' tab
  element :project_spent_time_tab, '.time-entries.selected'
  element :project_log_time_link, '.icon.icon-time-add'

  # 'Spent time' -> set Spent time window
  element :project_issue_time_entry_hours, '#time_entry_hours'
  element :project_issue_activity, '#time_entry_activity_id'
  element :project_issue_time_create, 'input[value="Create"]'
  element :project_issue_spent_time, '.spent-time.attribute div.value'
  element :project_issue_status, '.status.attribute div.value'
  element :project_issue_edit_submit_btn, 'input[value="Submit"]'
end
