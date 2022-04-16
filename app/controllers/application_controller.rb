class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :store_user_location!, if: :storable_location?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  def user_not_authorized
    flash[:alert] = "Sie sind dazu nicht erlaubt. Bitte einloggen."
    redirect_to(root_path)
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :cover, :are_you_in_mentoring50]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

end
