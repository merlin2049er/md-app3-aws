class AddWarehouseIdToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :warehouse_id ,  :integer

  end
end
