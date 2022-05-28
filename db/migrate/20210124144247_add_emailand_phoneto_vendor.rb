class AddEmailandPhonetoVendor < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :email, :string
    add_column :vendors, :phone, :string
  end
end
