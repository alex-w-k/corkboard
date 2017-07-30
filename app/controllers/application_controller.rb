class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  force_ssl if: :ssl_configured?

  helper_method :current_user
  helper_method :logged_in?
  helper_method :omniauth_user
  helper_method :user_redirect

  include FlashMessages

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def omniauth_user
    @omniauth_info ||= session[:omniauth_info] if session[:omniauth_info]
  end

  def pro_user?
    current_user.pro?
  end

  def logged_in?
    session[:user_id] && session[:authenticated]
  end

  def user_redirect(user)
    if user.type
      redirect_to pro_dashboard_index_path
    else
      redirect_to profile_dashboard_path
    end
  end

  private

  def ssl_configured?
    Rails.env.in?(Rails.application.config.secure_envs) && request.path != '/cable'
  end

end
