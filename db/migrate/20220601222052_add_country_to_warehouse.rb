class AddCountryToWarehouse < ActiveRecord::Migration[6.1]
  def change
    add_column :warehouses, :country ,  :string
  end
end
