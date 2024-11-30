require "rails/code_statistics"

task stats: :more_stats

task :more_stats do
  %w[Components Contracts Forms Menus Policies Seeders Services Uploaders Validators Workers].each_with_index do |type, i|
    STATS_DIRECTORIES.insert i + 8, [type, "app/#{type.downcase}"]
    STATS_DIRECTORIES.insert i * 2 + 11, ["#{type} specs", "spec/#{type.downcase}"]
    CodeStatistics::TEST_TYPES << "#{type} specs"
  end
  STATS_DIRECTORIES.insert 10, ["Angular", "frontend/src"]
  STATS_DIRECTORIES.insert 11, ["Static Libraries", "lib_static"]
  STATS_DIRECTORIES.insert 12, ["Modules", "modules"]
  STATS_DIRECTORIES.insert 13, ["Packaging", "packaging"]
end