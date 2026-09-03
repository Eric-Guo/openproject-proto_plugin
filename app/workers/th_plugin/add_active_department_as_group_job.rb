class ThPlugin::AddActiveDepartmentAsGroupJob < ApplicationJob
  def perform
    departments = Cybros::Position.active_department_list
    departments.each do |department|
      group_name = department.op_group_name
      next if group_name.blank?

      Group.find_or_create_by!(name: group_name)
    end
  end
end
