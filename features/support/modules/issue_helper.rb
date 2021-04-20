# frozen_string_literal: true

# This module contains helper methods to work with Issues
module IssueHelper
  def create_issue(type, subject, status, priority, assignee)
    @projects_page.add_new_issue_link.click

    @new_issue_page = NewIssuePage.new
    @new_issue_page.issue_tracker.select(type)
    @new_issue_page.issue_subject.set subject
    @new_issue_page.issue_status.select(status)
    @new_issue_page.issue_priority.select(priority)
    @new_issue_page.issue_assignee.select(assignee)
    @new_issue_page.issue_create_btn.click
  end

  def issue_add_tracker(tracker)
    @projects_page.settings_issue_tracking_tab.click
    check tracker
    @projects_page.tracking_issue_save_btn.click
  end

  def issue_log_time(hours, activity)
    first(:link, 'Log time').click

    @projects_page.project_issue_time_entry_hours.set hours
    @projects_page.project_issue_activity.select activity
    @projects_page.project_issue_time_create.click
  end

  def close_issue
    first(:link, 'Edit').click
    @new_issue_page = NewIssuePage.new
    @new_issue_page.issue_status.select('Closed')
    @projects_page.project_issue_edit_submit_btn.click
  end
end

World(IssueHelper)
