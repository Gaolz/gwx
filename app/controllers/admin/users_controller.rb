# encoding: utf-8

require 'chinese_lunar/lunar'

module Admin
  # admin manages users
  class UsersController < AdminController
    before_action :set_user, only: [:edit, :update]

    def index
      @china_day = ChineseLunar::Lunar.new.lunar_date
      @user = User.new
      @users = User.order(:birthday).page(params[:page]).per(20)
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, flash: { success: 'user created successful' }
      else
        render :index
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, flash: { success: 'user update success' }
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :pinyin, :created_at, :birthday, :gender, :icon, :mobile)
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
