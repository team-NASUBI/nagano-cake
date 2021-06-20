class Public::CustomersController < ApplicationController
  before_action :authenticate_user!
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    customer = Customer.find(current_customer.id)
    if customer.update(customer_params)
      redirect_to customers_my_page_path(current_customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end
  
  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(withdrawal_status: true)
    reset_session
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :telephone_number, :withdrawal_status)
  end
end
