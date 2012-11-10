# -*- encoding : utf-8 -*-
module Ideevo
  module ControllerExtensions
    module Locale

      def self.included(base)
        base.before_filter :set_locale
      end

      def explicitly_requested_language
        params[:locale]
      end

      def session_language
        session[:locale]
      end

      def browser_language
        request.env['HTTP_ACCEPT_LANGUAGE'] ? request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first : nil
      end

      def default_language
        'en'
      end

      protected

      def select_language_according_to_priority
        explicitly_requested_language || session_language || browser_language || default_language
      end

      def available_locales
        %w{ de en fr es ca cs-CZ da et fa fi il it ko lt lv no-NO nl pl pt-BR pt-PT ru sk sl-SI sv-SE th vn zh-CN zh-TW }
      end

      def set_locale
        return unless available_locales.include?(select_language_according_to_priority)
        ::I18n.locale = select_language_according_to_priority
        locale = session[:locale] = ::I18n.locale
        logger.info("Set locale to #{locale}")
      end

    end
  end
end