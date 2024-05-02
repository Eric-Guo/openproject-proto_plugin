module OpenProject::ThPlugin
  module Patches::GroupPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods
      def add_members_to_group(action_user, new_users)
        user_ids = new_users.collect(&:id)

        # Ensure we use pluck to get the current DB version of user_ids
        current_user_ids = group_users.pluck(:user_id)

        call = Groups::UpdateService
          .new(user: action_user, model: self)
          .call(user_ids: (current_user_ids + user_ids).uniq)

        call.on_success do
          Rails.logger.debug "[ThPlugin groups] Added users #{user_ids} to #{name}"
        end

        call.on_failure do
          Rails.logger.error "[ThPlugin groups] Failed to add users #{user_ids} to #{name}: #{call.message}"
          raise ActiveRecord::Rollback
        end
      end
    end
  end
end