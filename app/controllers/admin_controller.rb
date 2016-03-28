class AdminController < ApplicationController
  layout 'admin'
  helper_method :current_admin?

  def admin_required
    redirect_to new_admin_session_path, alert: t('admin.session.need_login')\
      unless current_admin?
  end

  def current_admin?
    session[:login] && (session[:login] == Yetting.admin_session_login)
  end
end
