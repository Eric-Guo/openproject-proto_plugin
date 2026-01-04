# frozen_string_literal: true

module Bi
  class ThCalendar < BiLocalTimeRecord
    self.table_name = 'TH_CALENDAR'

    def self.non_working_days(check_days)
      return @non_working_days if @non_working_days.present?

      @non_working_days = Bi::ThCalendar.order(datestamp: :asc)
                                        .where(iswork: 'N').where(datestamp: check_days)
                                        .pluck(:datestamp).each_with_object({}) do |s, h|
        h[s] = true
      end
      @non_working_days[Date.new(2026, 1, 2)] = true if check_days.include?(Date.new(2026, 1, 2))
      @non_working_days[Date.new(2026, 1, 4)] = false if check_days.include?(Date.new(2026, 1, 4))
      @non_working_days
    end
  end
end