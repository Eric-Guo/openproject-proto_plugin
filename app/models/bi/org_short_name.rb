# frozen_string_literal: true

module Bi
  class OrgShortName < BiLocalTimeRecord
    self.table_name = 'ORG_SHORTNAME'

    def self.company_short_names_by_orgcode
      @company_short_names_by_orgcode ||= where(isbusinessunit: "Y").each_with_object({}) do |s, h|
        h[s.code] = s.shortname
      end
    end
  end
end