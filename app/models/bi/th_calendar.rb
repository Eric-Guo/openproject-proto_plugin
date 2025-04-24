# frozen_string_literal: true

module Bi
  class ThCalendar < BiLocalTimeRecord
    self.table_name = 'TH_CALENDAR'

    def self.non_working_days(check_days)
      Bi::ThCalendar
        .order(datestamp: :asc)
        .where(iswork: 'N').where(datestamp: check_days)
        .pluck(:datestamp).each_with_object({}) do |s, h|
        h[s] = true
      end
    end
  end
end