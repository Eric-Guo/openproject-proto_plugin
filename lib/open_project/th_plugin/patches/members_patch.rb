module OpenProject::ThPlugin
  module Patches::MembersPatch
    def self.mixin!
      ::Members::TableComponent.prepend TableComponent
      ::Members::RowComponent.prepend RowComponent
    end

    module TableComponent
      def columns
        if th_members_enabled?
          super + %i[company position remark]
        else
          super
        end
      end

      def th_members_enabled?
        if @th_members_enabled.nil?
          @th_members_enabled = project.present? && project.module_enabled?(:th_members)
        end

        @th_members_enabled
      end
    end

    module RowComponent
      def company
        render Members::CompanyColumnComponent.new(member, form_id: "member-#{member.id}-company", row: self, params: controller.params)
      end

      def position
        render Members::PositionColumnComponent.new(member, form_id: "member-#{member.id}-position", row: self, params: controller.params)
      end

      def remark
        render Members::RemarkColumnComponent.new(member, form_id: "member-#{member.id}-remark", row: self, params: controller.params)
      end
    end
  end
end