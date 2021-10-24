class Public::CartItemsController < ApplicationController

before_action :authenticate_customer!

  def index
    @cart_items= current_customer.cart_items.all
    #@total = @cart_items.inject(0) { |sum, item| sum + (item.sum_of_price.to_i * add_tax_price) }
    @total=0
    @cart_items.each do |cart|
      @total = @total + (cart.item.price * cart.amount) * 1.1
    end
    @cart_item = CartItem.new
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      if @cart_item.present?
        @cart_item.update(amount: @cart_item.amount + params[:cart_item][:amount].to_i)
        redirect_to cart_items_path
      else
        @cart_item = current_customer.cart_items.new(cart_item_params)
        @cart_item.save!
        redirect_to cart_items_path
      end


  end

  def update
    @cart_item = CartItem.find(params[:id])
      if @cart_item.update(cart_item_params)

        flash[:notice] = 'カート内の商品が更新されました'
      else
        flash[:alert] = 'カート内の商品の更新に失敗しました'
      end
      redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end