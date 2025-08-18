require "rails/code_statistics"

task stats: :more_stats

task :more_stats do
  %w[Components Contracts Forms Menus Policies Seeders Services Uploaders Validators Workers].each do |type|
    Rails::CodeStatistics.register_directory(type, "app/#{type.downcase}")
    Rails::CodeStatistics.register_directory("#{type} specs", "spec/#{type.downcase}")
    Rails::CodeStatistics::TEST_TYPES << "#{type} specs"
  end
  Rails::CodeStatistics.register_directory("Angular", "frontend/src")
  Rails::CodeStatistics.register_directory("Static Libraries", "lib_static")
  Rails::CodeStatistics.register_directory("Modules", "modules")
  Rails::CodeStatistics.register_directory("Packaging", "packaging")
end