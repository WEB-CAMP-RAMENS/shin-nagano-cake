class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.integer "item_id"
      t.integer "order_id"
      t.integer "purchase_price"
      t.integer "product_status", default: 0
      t.integer "quantity"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

       t.timestamps
    end
  end
end
