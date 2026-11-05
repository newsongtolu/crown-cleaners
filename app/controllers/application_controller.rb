class ApplicationController < ActionController::Base
  helper_method :current_admin_user, :logged_in?

  protect_from_forgery with: :exception

  private

  def current_admin_user
    @current_admin_user ||= AdminUser.find_by(id: session[:admin_user_id]) if session[:admin_user_id]
  end

  def logged_in?
    current_admin_user.present?
  end

  def authenticate_admin!
    redirect_to admin_login_path, alert: "Please sign in to continue." unless logged_in?
  end

  # Allow dev tunnels and forwarded proxy headers in development
  def verified_request?
    super || (Rails.env.development? && (
      request.headers['HTTP_ORIGIN']&.include?('devtunnels.ms') ||
      request.headers['HTTP_X_FORWARDED_HOST']&.include?('devtunnels.ms')
    ))
  end
end