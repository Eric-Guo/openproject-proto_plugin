# frozen_string_literal: true

module Cybros
  class PositionUser < ApplicationRecord
    belongs_to :user
    belongs_to :position

    delegate :name, to: :position, prefix: :position

    def self.active_position_user_by_group_name
      PositionUser.joins(:user).where.not(user: { locked_at: nil }).group_by { |position_user| position_user.department.op_group_name }
    end
  end
end