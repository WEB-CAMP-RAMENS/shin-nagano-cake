class AddFullNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :full_name, :string
  end
end
