# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'open_project/th_plugin/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-th_plugin"
  s.version     = OpenProject::ThPlugin::VERSION
  s.authors     = "OpenProject GmbH"
  s.email       = "info@openproject.org"
  s.homepage    = "https://git.thape.com.cn/rails/openproject-th_plugin"  # TODO check this URL
  s.summary     = 'OpenProject Thape Plugin'
  s.description = "A Thape OpenProject plugin"
  s.license     = "GPLv3"

  s.files = Dir["{app,config,db,lib}/**/*"] + %w(CHANGELOG.md README.md)

  s.add_dependency "rails", '~> 7.0'
end