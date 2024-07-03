module OpenProject::ThPlugin
  module Patches
    module API
      module NotificationRepresenter
        module_function

        def extension
          ->(*) do
            property :reason_name,
                     exec_context: :decorator,
                     getter: ->(*) { I18n.t("js.notifications.reasons.#{::API::V3::Notifications::PropertyFactory::reason_for(represented)}") }
          end
        end
      end
    end
  end
end