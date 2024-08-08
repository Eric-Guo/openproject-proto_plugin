# frozen_string_literal: true

module Cybros
  class User < ApplicationRecord
    default_scope { where.not(clerk_code: "").where.not(clerk_code: nil) }
    scope :active, -> { where(locked_at: nil).joins(:position_users).distinct }

    has_many :department_users
    has_many :departments, through: :department_users
    has_many :position_users, -> { order(main_position: :desc) }
    has_many :positions, through: :position_users
    belongs_to :op_user, class_name: '::User', foreign_key: 'email', primary_key: 'mail'

    has_one :stfreinstate, -> { active }, class_name: 'Hrdw::HrdwStfreinstateBi', foreign_key: :clerkcode, primary_key: :clerk_code

    has_many :work_hours_projects, class_name: 'Bi::WorkHoursProject', foreign_key: :clerkcode, primary_key: :clerk_code

    def profession
      raw_profession = stfreinstate&.profession
      if raw_profession == '机电'
        stfreinstate&.gxname&.gsub('子公司', '')
      else
        raw_profession
      end
    end
  end
end