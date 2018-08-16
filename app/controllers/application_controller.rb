class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    return if current_user

    flash[:notice] = 'You should be logged to share your story'
    respond_to do |format|
      format.html { redirect_to login_path }
      format.js   { render js: "window.location.href='#{login_url}'" }
    end
  end
end
