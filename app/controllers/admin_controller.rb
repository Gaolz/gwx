# admin root controller
class AdminController < ApplicationController
  layout 'admin'

  before_action :require_admin
  before_action :set_active_menu

  def set_active_menu
    @current = ['/' + ['admin', controller_name].join('/')]
  end

  def require_admin
    render_404 unless current_admin?
  end
end
