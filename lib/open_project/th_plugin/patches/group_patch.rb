module OpenProject::ThPlugin
  module Patches::GroupPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods
      def add_and_remove_members_to_group(action_user, new_user_ids, remove_user_ids)
        # Ensure we use pluck to get the current DB version of user_ids
        current_user_ids = group_users.pluck(:user_id)

        call = Groups::UpdateService
          .new(user: action_user, model: self)
          .call(user_ids: (current_user_ids + new_user_ids - remove_user_ids).uniq)

        call.on_success do
          Rails.logger.debug "[ThPlugin groups] Added users #{new_user_ids} to #{name}"
          Rails.logger.debug "[ThPlugin groups] Removed users #{remove_user_ids} to #{name}"
        end

        call.on_failure do
          Rails.logger.error "[ThPlugin groups] Failed to add users #{new_user_ids} to #{name}: #{call.message}"
          raise ActiveRecord::Rollback
        end
      end
    end
  end
end