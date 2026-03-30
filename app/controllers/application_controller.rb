class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale, :set_variable

  private

  def set_variable
    @organization = Organization.last

    @logo_organization = @organization.logo
    @name_organization = @organization.name
    @picturies = Picture.last

    @entries = Enter.all
    @parallax = @picturies.parallax
    @heroimage = @picturies.heroimage
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :phone, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :phone, :password])
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
