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
    has_many :assistent_bosses, dependent: :destroy, class_name: "Bi::AssistentForBoss", foreign_key: :user_clerk_code, primary_key: :clerk_code

    def profession
      raw_profession = stfreinstate&.profession
      if raw_profession == '机电'
        stfreinstate&.gxname&.gsub('子公司', '')
      else
        raw_profession
      end
    end

    def readonly?
      false
    end

    def dt_users
      dt_clerk_codes = assistent_bosses.pluck(:dt_clerk_code).compact_blank.uniq
      return self.class.none if dt_clerk_codes.empty?

      # `assistent_bosses` is loaded from the BI connection, so this must stay a
      # two-step lookup instead of a cross-database `has_many :through` join.
      self.class.where(clerk_code: dt_clerk_codes).in_order_of(:clerk_code, dt_clerk_codes)
    end
  end
end