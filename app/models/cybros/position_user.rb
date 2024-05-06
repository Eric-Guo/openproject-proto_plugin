# frozen_string_literal: true

module Cybros
  class PositionUser < ApplicationRecord
    belongs_to :user
    belongs_to :position

    delegate :name, to: :position, prefix: :position

    def self.active_user_positions
      PositionUser.joins(:user).where.not(user: { locked_at: nil })
    end
  end
end