# frozen_string_literal: true

module Cybros
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
    unless Rails.env.test?
      ActiveRecord.default_timezone = :local
      establish_connection :cybros
    end

    def readonly?
      true
    end
  end
end
