class UpdateDataTypeProductIdToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :product_id, :string
    add_column :images, :product_id, :integer
  end
end
