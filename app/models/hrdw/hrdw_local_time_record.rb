# frozen_string_literal: true

module Hrdw
  class HrdwLocalTimeRecord < ActiveRecord::Base
    self.abstract_class = true
    unless Rails.env.test?
      ActiveRecord.default_timezone = :local
      establish_connection :hrdw
    end

    def readonly?
      true
    end
  end
end