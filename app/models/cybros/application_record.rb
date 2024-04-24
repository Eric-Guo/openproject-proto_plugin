# frozen_string_literal: true

module Cybros
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
    ActiveRecord.default_timezone = :local
    establish_connection :cybros unless Rails.env.test?

    def readonly?
      true
    end
  end
end
