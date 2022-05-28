class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :vendor
      t.string :contact_name
      t.string :address1
      t.string :address2
      t.string :website
      t.text   :product
      t.boolean :dropship
      t.integer :processing
      t.boolean :locally
      t.string :payments

      t.timestamps
    end
  end
end
