class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :set_locale
  #
  # This doesn't work in Safari!
  # def set_locale
  #   I18n.default_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/[a-z]{2}(?=;)/)
  #   I18n.locale = params[:locale] || I18n.default_locale.first.to_sym
  # end

  def set_admin_locale
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    I18n.default_locale = :ru
    I18n.reload!
  end
end
