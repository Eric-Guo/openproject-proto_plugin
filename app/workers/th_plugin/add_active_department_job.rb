class ThPlugin::AddActiveDepartmentJob < ApplicationJob
  def perform
    departments = Cybros::Position.active_department_list
    departments.each do |department|
      group_name = department.op_group_name
      next if group_name.blank?

      group = Group.find_or_initialize_by(name: group_name)
      group.save
    end
  end
end