class Admin::SessionsController < AdminController
  def new
  end

  def create
    if Yetting.admin.blank?
      flash.now[:alert] = t('admin.session.no_configuration')
      render :new
    elsif Yetting.admin != params[:username]
      flash.now[:alert] = t('admin.session.username_error')
      render :new
    elsif Yetting.admin_password != params[:password]
      flash.now[:alert] = t('admin.session.password_error')
      render :new
    else
      session[:login] = Yetting.admin_session_login
      redirect_to admin_root_path, notice: t('admin.session.login_success')
    end
  end
end
