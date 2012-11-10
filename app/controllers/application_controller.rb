# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

  include Ideevo::ControllerExtensions::Locale
  include Ideevo::ControllerExtensions::Currency

  protect_from_forgery

  helper_method :available_locales

end
