class AddCityandstatetoVendor < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :city, :string
    add_column :vendors, :state, :string
  end
end
