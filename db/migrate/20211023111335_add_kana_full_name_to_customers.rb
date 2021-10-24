class AddKanaFullNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :kana_full_name, :string
  end
end
