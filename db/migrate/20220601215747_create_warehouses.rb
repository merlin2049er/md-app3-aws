class CreateWarehouses < ActiveRecord::Migration[6.1]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :prov
      t.string :postalcode

      t.timestamps
    end
  end
end
