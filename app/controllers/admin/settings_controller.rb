class Admin::SettingsController < AdminController
  before_action :admin_required
  # http_basic_authenticate_with name: Setting.admin_login, password: Setting.admin_pass

  def index
    @settings = Setting.all
  end

  def create
    var, value = params[:var], params[:value]
    if var.present? && value.present?
      @setting = Setting.find_by(var: var)
      if @setting.nil?
        Setting.create(var: var, value: value)
      else
        @setting.value = value
        @setting.save
      end
      redirect_back fallback_location: admin_settings_path, flash: { success: "update/create setting successful" }
    end
  end

  def destroy
    setting = Setting.find params[:id]
    setting.destroy
    redirect_back fallback_location: admin_settings_path, flash: { success: "update/create setting successful" }
  end

  #def get_setting
    #@setting = Setting.find_by(var: params[:id]) || Setting.new(var: params[:id])
  #end
end
