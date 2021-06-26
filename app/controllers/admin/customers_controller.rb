class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を変更しました。"
      redirect_to admin_customers_path
    else
      render 'edit'
    end
  end

  private
  def customer_params
     params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name,
                                      :email, :withdrawal_status, :postal_code, :address, :telephone_number)
  end
end
