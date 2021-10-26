class RenameCustomerIdColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :cutomer_id, :customer_id
  end
end
