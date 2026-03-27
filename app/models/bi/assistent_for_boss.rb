# frozen_string_literal: true

module Bi
  class AssistentForBoss < BiLocalTimeRecord
    self.table_name = 'V_Pending_user'
    belongs_to :assistent, class_name: 'Cybros::User', foreign_key: :user_clerk_code, primary_key: :clerk_code, optional: false
    belongs_to :dt_user, class_name: 'Cybros::User', foreign_key: :dt_clerk_code, primary_key: :clerk_code, optional: false
  end
end