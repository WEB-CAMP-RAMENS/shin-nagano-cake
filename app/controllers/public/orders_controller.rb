class Public::OrdersController < ApplicationController


  def new
   @order = Order.new
   @customer = current_customer
   @addresses = Address.where(customer_id: current_customer.id)
  end


  def complete
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
  	@order = Order.find(params[:id])
    @order_detail=CartItem.all
  end

  def confirm
    @order = Order.new
    @postage = 800
    @cart_items = current_customer.cart_items.all
    @order.payment_method = params[:order][:payment_method]
    @total = 0
     @cart_items.each do |cart_item|
       @total += (cart_item.item.price * cart_item.amount) * 1.1
     end
    @order.total_payment = @total

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
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.save
    @cart_items = CartItem.all
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.order_id = @order.id
      @order_detail.price = ((cart_item.item.price) * 1.1).floor
      @order_detail.amount = cart_item.amount
      if @order_detail.save
        cart_item.destroy
      end
    end
    redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment )
  end

  def confirm_params
     params.require(:order).permit(:address_option, :address_id, :postal_code, :address, :name, :payment_method)
  end

end