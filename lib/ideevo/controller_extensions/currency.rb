# -*- encoding : utf-8 -*-
module Ideevo
  module ControllerExtensions
    module Currency

      def self.included(base)
        base.before_filter :force_currency_for_all_locales
      end

      private

      def force_currency_for_all_locales
        unless t('number.currency.format.unit') == 'EUR'
          I18n.available_locales.each do |locale|
            hash = {
              number: {
                currency: {
                  format: {
                    format: "%n %u",
                    unit: "EUR",
                    precision: 2,
                    separator: ',',
                    delimiter: ' ',
                  }
                }
              }
            }
            I18n.backend.store_translations locale, hash
          end
        end
        true
      end

    end
  end
end