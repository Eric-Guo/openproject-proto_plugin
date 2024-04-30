class ThPlugin::AddActiveDepartmentJob < ApplicationJob
  def perform
    departments = Cybros::Position.active_department_list
    departments.each do |department|
      dept_name = Bi::PkCodeName.mapping2deptcode.fetch(department.dept_code, department.dept_code)
      company_name = Bi::OrgShortName.company_short_names_by_orgcode.fetch(department.company_code, department.company_code)
      next if dept_name.include?('撤销')

      group_name = if dept_name.start_with?('天华集团')
        dept_name
      else
        "#{company_name}-#{dept_name}"
      end

      puts group_name
    end
  end
end