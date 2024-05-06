# frozen_string_literal: true

module Cybros
  class Department < ApplicationRecord
    has_many :department_users
    has_many :users, through: :department_users

    default_scope { where.not(dept_code: "").where.not(dept_code: nil) }

    def op_group_name
      return if dept_code.blank?

      dept_name = Bi::PkCodeName.mapping2deptcode.fetch(dept_code, dept_code)
      company_name = Bi::OrgShortName.company_short_names_by_orgcode.fetch(company_code, company_code)
      return if dept_name.include?('撤销')

      if dept_name.start_with?('天华集团')
        dept_name
      else
        "#{company_name}-#{dept_name}"
      end
    end
  end
end