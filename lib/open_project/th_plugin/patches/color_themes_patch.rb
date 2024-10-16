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
          super.append(plm_dark, thape_ib, thape_ib_new, plm_light)
        end

        def plm_dark
          {
            theme: 'Thape Dark',
            colors: {
              'primary-button-color' => '#175A8E',
              'accent-color' => '#171F38',
              'header-bg-color' => '#171F38',
              'header-item-bg-hover-color' => '#475974',
              'main-menu-bg-color' => '#171F38',
              'main-menu-bg-selected-background' => '#425167',
              'main-menu-bg-hover-background' => '#475974',
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
              'main-menu-bg-color' => '#333739',
              'main-menu-bg-selected-background' => '#797291',
              'main-menu-bg-hover-background' => '#8F89A3',
            },
            logo: 'plm/logo_plm_dark.png'
          }
        end

        def thape_ib_new
          {
            theme: 'Thape IB New',
            colors: {
              'primary-button-color' => '#8F89A3',
              'accent-color' => '#1F1547',
              'header-bg-color' => '#1F1547',
              'header-item-bg-hover-color' => '#8F89A3',
              'main-menu-bg-color' => '#333739',
              'main-menu-bg-selected-background' => '#797291',
              'main-menu-bg-hover-background' => '#8F89A3',
            },
            logo: 'plm/logo_plm_new.png'
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
              'main-menu-bg-color' => '#F6F8F9',
              'main-menu-bg-selected-background' => '#E6EBF9',
              'main-menu-bg-hover-background' => '#E6EBF9',
            },
            logo: 'plm/logo_plm.png'
          }
        end
      end
    end
  end
end