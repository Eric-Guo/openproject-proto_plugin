# Prevent load-order problems in case openproject-plugins is listed after a plugin in the Gemfile
# or not at all
require 'active_support/dependencies'
require 'open_project/plugins'
require_relative 'patches/api/user_representer'

module OpenProject::ThPlugin
  class Engine < ::Rails::Engine
    engine_name :openproject_th_plugin

    include OpenProject::Plugins::ActsAsOpEngine

    register(
      'openproject-th_plugin',
      author_url: 'https://www.thape.com',
      requires_openproject: '>= 13.5.0',
      name: :project_module_th_plugin,
    ) do
      # We define a new project module here for our controller including a permission.
      # The permission is necessary for us to be able to add menu items to the project
      # menu. You will not need to add a permission for adding menu items to the `top_menu`
      # or `admin_menu`, however.
      #
      # You may have to enable the project module ("Kittens module") under project
      # settings before you can see the menu entry.
      project_module :th_members_module do
        permission :view_th_plugin_members,
                   {
                      th_members: %i[index],
                      angular_kittens: %i[show]
                   },
                   permissible_on: [:project]

        permission :manage_th_plugin_members,
                   {
                      th_members: %i[new create edit destroy],
                      angular_kittens: %i[show]
                   },
                   permissible_on: [:project]
      end

      menu :project_menu,
           :kittens,
           { controller: '/th_members', action: :index },
           caption: :label_th_member_plural,
           if: ->(project) { project.module_enabled?('th_members_module') },
           icon: 'training-consulting',
           after: :members

      menu :top_menu,
           :angular_kittens,
           '/angular_kittens',
           after: :kittens,
           icon: 'training-consulting',
           param: :project_id,
           caption: :label_kittens
    end

    config.to_prepare do
      ::OpenProject::ThPlugin::Hooks
    end

    extend_api_response(:v3, :users, :user,
                        &::OpenProject::ThPlugin::Patches::API::UserRepresenter.extension)

    config.after_initialize do
      OpenProject::Static::Homescreen.manage :blocks do |blocks|
        blocks.push(
          { partial: 'homescreen_block', if: Proc.new { true } }
        )
      end
    end

    config.after_initialize do
      OpenProject::Notifications.subscribe 'user_invited' do |token|
        user = token.user

        Rails.logger.debug "#{user.mail} invited to OpenProject"
      end
    end

    assets %w(kitty.png)
  end
end