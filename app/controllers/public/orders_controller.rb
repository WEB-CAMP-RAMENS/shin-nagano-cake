class Public::OrdersController < ApplicationController


  def new
   @order = Order.new
   @customer = current_customer
   @addresses = Address.where(customer_id: current_customer.id)
  end


  def complete
  end

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(6)
    @orders = Order.where(customer_id: current_customer)
  end

  def show
  	@order = Order.find(params[:id])
  	@order_details = @order.order_dates
  end

def confirm
    @order = Order.new
    @postage = 800
    @cart_items = current_customer.cart_items.all
    # @order.payment_method = params[:order][:payment_method]
    @total = 0
     @cart_items.each do |cart_item|
       @total = @total + (cart_item.item.price * cart_item.amount) * 1.1
     end

    case params[:order][:address_option]
      when '0'
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.full_name
      when '1'
        address = Address.find(params[:order][:address_id])
        @order.postal_code = address.postal_code
        @order.address = address.address
        @order.name = address.name
      when '2'
        @order.postal_code = params[:order][:new_post_code]
        @order.address = params[:order][:new_address]
        @order.name = params[:order][:new_name]
    end
end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.save
    @cart_items = CartItem.all
      @cart_items.each do |cart_item|
      @ordered_item = OrderedItem.new
      @ordered_item.item_id = cart_item.item_id
      @ordered_item.order_id = @order.id
      @ordered_item.purchase_price = cart_item.item.add_tax_price
      if @ordered_item.save
        cart_item.destroy
      end
    end
    redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :postage, :total_payment, :payment_method, :order_status)
  end

   def confirm_params
     params.require(:order).permit(:address_option, :address_id, :new_post_code, :new_address, :new_name, :payment_method)
   end

end