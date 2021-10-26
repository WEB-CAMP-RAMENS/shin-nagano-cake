class AddOrderStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address_option, :integer
    add_column :orders, :address_id, :integer
    add_column :orders, :order_status, :integer, default: 0
  end
end
