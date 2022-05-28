class AddCountrytoVendor < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :country, :string
  end
end
