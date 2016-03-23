class AdminController < ApplicationController
  layout 'admin'
  def admin_required
    redirect_to new_admin_session_path, alert: t('admin.session.need_login')\
      unless session[:login] && (session[:login] == Yetting.admin_session_login)
  end
end
