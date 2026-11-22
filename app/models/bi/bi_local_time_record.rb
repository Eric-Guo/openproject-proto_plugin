# frozen_string_literal: true

module Bi
  class BiLocalTimeRecord < ActiveRecord::Base
    self.abstract_class = true
    ActiveRecord.default_timezone = :local
    establish_connection :cybros_bi unless Rails.env.test?

    def readonly?
      true
    end
  end
end
