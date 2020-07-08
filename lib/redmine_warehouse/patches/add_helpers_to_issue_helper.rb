module RedmineWarehouse
  module Patches
    module AddHelpersToIssueHelpers
      def self.included(base) # :nodoc:
        base.class_eval do
          helper :products
        end
      end
    end
  end
end


unless IssuesController.included_modules.include?(RedmineWarehouse::Patches::AddHelpersToIssueHelpers)
  IssuesController.send(:include, RedmineWarehouse::Patches::AddHelpersToIssueHelpers)
end

unless ImportsController.included_modules.include?(RedmineWarehouse::Patches::AddHelpersToIssueHelpers)
  ImportsController.send(:include, RedmineWarehouse::Patches::AddHelpersToIssueHelpers)
end if Redmine::VERSION.to_s > '3.2'