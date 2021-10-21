class AddOrderStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_status, :integer
    add_column :orders, :address_option, :integer
    add_column :orders, :address_id, :integer
    add_column :orders, :new_post_code, :string
    add_column :orders, :new_address, :string
    add_column :orders, :new_name, :string
  end
end
