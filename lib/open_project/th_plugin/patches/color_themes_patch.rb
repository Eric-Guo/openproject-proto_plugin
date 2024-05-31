# frozen_string_literal: true

require 'open_project/custom_styles/design'

module OpenProject::ThPlugin
  module Patches
    module ColorThemesPatch
      def self.included(base)
        class << base
          prepend ClassMethods
        end
      end

      module ClassMethods
        def themes
          super.append(plm_dark, thape_ib, plm_light)
        end

        def plm_dark
          {
            theme: 'Thape Dark',
            colors: {
              'primary-button-color' => '#175A8E',
              'accent-color' => '#171F38',
              'header-bg-color' => '#171F38',
              'header-item-bg-hover-color' => '#475974',
              'header-item-font-color' => '#9B9A9A',
              'header-item-font-hover-color' => '#E0EFF6',
              'header-border-bottom-color' => '',
              'main-menu-bg-color' => '#171F38',
              'main-menu-bg-selected-background' => '#425167',
              'main-menu-bg-hover-background' => '#475974',
              'main-menu-font-color' => '#FFFFFF',
              'main-menu-hover-font-color' => '#39C1F5',
              'main-menu-selected-font-color' => '#E0EFF6',
              'main-menu-border-color' => '#001873'
            },
            logo: 'plm/logo_plm_dark.png'
          }
        end

        def thape_ib
          {
            theme: 'Thape IB',
            colors: {
              'primary-button-color' => '#8F89A3',
              'accent-color' => '#1F1547',
              'header-bg-color' => '#1F1547',
              'header-item-bg-hover-color' => '#8F89A3',
              'header-item-font-color' => '#FFFFFF',
              'header-item-font-hover-color' => '#FFFFFF',
              'header-border-bottom-color' => '',
              'main-menu-bg-color' => '#333739',
              'main-menu-bg-selected-background' => '#797291',
              'main-menu-bg-hover-background' => '#8F89A3',
              'main-menu-font-color' => '#FFFFFF',
              'main-menu-hover-font-color' => '#FFFFFF',
              'main-menu-selected-font-color' => '#FFFFFF',
              'main-menu-border-color' => '#EAEAEA'
            },
            logo: 'plm/logo_plm_dark.png'
          }
        end

        def plm_light
          {
            theme: 'Thape Light',
            colors: {
              'primary-button-color' => '#01156C',
              'accent-color' => '#01156C',
              'header-bg-color' => '#FBFBFB',
              'header-item-bg-hover-color' => '#E6EBF9',
              'header-item-font-color' => '#87898C',
              'header-item-font-hover-color' => '#196CE8',
              'header-border-bottom-color' => '#E6EBF9',
              'main-menu-bg-color' => '#F6F8F9',
              'main-menu-bg-selected-background' => '#E6EBF9',
              'main-menu-bg-hover-background' => '#E6EBF9',
              'main-menu-font-color' => '#01156C',
              'main-menu-hover-font-color' => '#196CE8',
              'main-menu-selected-font-color' => '#041E91',
              'main-menu-border-color' => '#F0F3FE'
            },
            logo: 'plm/logo_plm.png'
          }
        end
      end
    end
  end
end