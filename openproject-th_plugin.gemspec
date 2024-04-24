# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'open_project/th_plugin/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-th_plugin"
  s.version     = OpenProject::ThPlugin::VERSION
  s.authors     = "Shanghai TIANHUA Architecture Planning & Engineering Ltd."
  s.email       = "guochunzhong@thape.com.cn"
  s.homepage    = "https://git.thape.com.cn/rails/openproject-th_plugin"
  s.summary     = 'OpenProject THAPE perple plugin'
  s.description = "A Thape OpenProject plugin"
  s.license     = "GPLv3"

  s.files = Dir["{app,config,db,lib}/**/*"] + %w(CHANGELOG.md README.md)

  s.add_dependency 'rails', '~> 7.1'
  s.add_dependency 'mysql2'
end