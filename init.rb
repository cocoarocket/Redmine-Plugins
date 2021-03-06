Redmine::Plugin.register :redmine_warehouse do
  name 'Redmine Warehouse plugin'
  author 'VItaly Simakov'
  description 'This is a plugin for Redmine Job test'
  version '0.0.1'
  url 'https://github.com/cocoarocket/Redmine-Plugins-Warehouse'
  author_url 'https://github.com/cocoarocket'

  menu :application_menu, :redmine_warehouse, { controller: "products", action: "index" }, caption: "Склад"
end

require "redmine_warehouse/hooks/views_issues_hook"
require "redmine_warehouse/patches/add_helpers_to_issue_helper"
