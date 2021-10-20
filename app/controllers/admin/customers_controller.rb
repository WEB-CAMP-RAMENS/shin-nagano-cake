class Admin::CustomersController < ApplicationController
  
  def show
    @admin_customer = Customers.find(params[:id])
    @admin_customers = Customers.all
  end
  
  def index
    @admin_customer = Customer.new
    @admin_customers = Customer.all
  end
  
  def edit
    @admin_customer = Customer.find(params[:id])

  end
  
  def create
    @admin_customer = Customer.new(genre_params)
    @admin_customer.save
  end

  def update
    @admin_customer = Customer.find(params[:id])
    if @admin_customer.update(customers_params)
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end
  
  
  private

  def customers_params
    params.require(:customers).permit(:customer_id,:address,)

  end


  
  
end
