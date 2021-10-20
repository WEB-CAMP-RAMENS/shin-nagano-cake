class Admin::CustomersController < ApplicationController
  
  def show
    @admin_customer = Customers.find(params[:id])
    @admin_customers = Customers.all
  end
  
  def index
    @admin_customer = Customers.new
    @admin_customers = Customers.all
  end
  
  
  private

  def customers_params
    params.require(:customers).permit(:customer_id,:address,)

  end


  
  
end
