# application root controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :format_time, :format_date, :current_admin?

  def format_time(time)
    time.strftime('%Y-%m-%d %H:%M')
  end

  def format_date(time)
    time.strftime('%Y.%m.%d')
  end

  def current_admin?
    session[:login] == Yetting.admin_session_login
  end

  def render_404
    render_optional_error_file(404)
  end

  def render_optional_error_file(status_code)
    status = status_code.to_s
    fname = %w(404 403 422 500).include?(status) ? status : 'unknown'
    render template: "/errors/#{fname}", format: [:html],
      handler: [:erb], status: status, layout: 'application'
  end
end
