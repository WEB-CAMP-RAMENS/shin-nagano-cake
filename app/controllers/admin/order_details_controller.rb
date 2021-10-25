class Admin::OrderDetailsController < ApplicationController

 def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "製作中"
      @order_detail.order.update(order_status: "製作中")
    end
    @order_details = OrderDetail.where(order_id: @order_detail.order.id)
    if @order_details.count == @order_details.where(making_status: "製作完了").count
      @order_detail.order.update(order_status: "発送準備中")
    end

    redirect_to request.referer
 end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end