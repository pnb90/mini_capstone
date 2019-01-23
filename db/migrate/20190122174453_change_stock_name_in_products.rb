class ChangeStockNameInProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :stock, :in_stock
  end
end
