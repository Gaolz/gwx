class Admin::AccountsController < AdminController
  before_action :admin_required

  def index
    @account = Account.new
    @accounts = Account.order("ID DESC")
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to admin_accounts_path
    else
      render "something wrong"
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update!(params_account)
      redirect_to admin_accounts_path
    else
      render "somethig wrong"
    end
  end

  private

  def account_params
    params.require(:account).permit(:description, :price).merge(created_at: Time.current)
  end

  def params_account
    params.require(:account).permit(:description, :price, :created_at)
  end
end
