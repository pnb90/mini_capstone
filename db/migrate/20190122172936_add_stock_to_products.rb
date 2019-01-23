class AddStockToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :stock, :boolean
    change_column_default :products, :stock, from: nil, to: true
  end
end
