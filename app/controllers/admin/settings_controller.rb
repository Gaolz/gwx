module Admin
  # admin manages settings
  class SettingsController < AdminController
    before_action :admin_required
    http_basic_authenticate_with name: Setting.admin_login, password: Setting.admin_pass

    def index
      @settings = Setting.all
    end

    def create
      @setting = Setting.find_or_initialize_by(var: params[:var]).update_attributes!(value: params[:value])
      redirect_back fallback_location: admin_settings_path, flash: { success: 'update/create setting successful' }
    end

    def destroy
      setting = Setting.find params[:id]
      setting.destroy
      redirect_back fallback_location: admin_settings_path, flash: { success: 'update/create setting successful' }
    end

  end
end
