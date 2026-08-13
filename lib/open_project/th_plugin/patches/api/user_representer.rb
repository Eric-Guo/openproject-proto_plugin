module OpenProject::ThPlugin
  module Patches
    module API
      module UserRepresenter
        module_function

        def extension
          ->(*) do
            property :company,
                     exec_context: :decorator,
                     render_nil: false,
                     getter: ->(*) { represented.company },
                     setter: ->(fragment:, represented:, **) { represented.company = fragment },
                     writable: -> { true },
                     cache_if: -> { current_user_is_admin? }

            property :th_department,
                     as: :th_department,
                     exec_context: :decorator,
                     render_nil: false,
                     getter: ->(*) { represented.th_department },
                     setter: ->(fragment:, represented:, **) { represented.th_department = fragment },
                     writable: -> { true },
                     cache_if: -> { current_user_is_admin? }

            property :title,
                     exec_context: :decorator,
                     render_nil: false,
                     getter: ->(*) { represented.title },
                     setter: ->(fragment:, represented:, **) { represented.title = fragment },
                     writable: -> { true },
                     cache_if: -> { current_user_is_admin? }

            property :mobile,
                     exec_context: :decorator,
                     render_nil: false,
                     getter: ->(*) {},
                     setter: ->(fragment:, represented:, **) { represented.mobile = fragment },
                     writable: -> { true }
          end
        end
      end
    end
  end
end
