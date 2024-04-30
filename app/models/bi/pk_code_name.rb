# frozen_string_literal: true

module Bi
  class PkCodeName < BiLocalTimeRecord
    self.table_name = "PK_CODE_NAME"

    def self.mapping2deptcode
      @_mapping2deptcode ||= PkCodeName.all.each_with_object({}) do |s, h|
        h[s.deptcode] = s.deptname
      end
    end
  end
end