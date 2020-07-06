Redmine::Plugin.register :redmine_warehouse do
  name 'Redmine Warehouse plugin'
  author 'VItaly Simakov'
  description 'This is a plugin for Redmine Job test'
  version '0.0.1'
  url 'https://github.com/cocoarocket/Redmine-Plugins-Warehouse'
  author_url 'https://github.com/cocoarocket'

  menu :application_menu, :redmine_warehouse, { controller: "products", action: "index" }, caption: "Склад"
end
