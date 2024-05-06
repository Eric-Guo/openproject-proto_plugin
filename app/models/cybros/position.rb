# frozen_string_literal: true

module Cybros
  class Position < ApplicationRecord
    belongs_to :department, optional: true

    has_many :position_users, dependent: :destroy
    has_many :users, through: :position_users

    default_scope { joins(:department).where.not(department: { dept_code: "" }).where.not(department: { dept_code: nil }) }

    def self.active_department_list
      Position.joins(:users).where(users: { locked_at: nil }).collect(&:department).uniq
    end
  end
end