module Admin
  # everyday payment
  class AccountsController < AdminController

    def index
      @account = Account.new
      @accounts = Account.order('ID DESC').page(params[:page]).per(10)
    end

    def create
      @account = Account.new(params_account)
      if @account.save
        redirect_to admin_accounts_path
      else
        render 'something wrong'
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
        render 'somethig wrong'
      end
    end

    private

    def params_account
      params.require(:account).permit(:description, :price, :created_at)
    end
  end
end
