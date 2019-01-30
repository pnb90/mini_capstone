class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :subtotal, precision: 20, scale: 2
      t.decimal :tax, precision: 20, scale: 2
      t.decimal :total, precision: 20, scale: 2

      t.timestamps
    end
  end
end
