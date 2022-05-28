class AddCouriertoVendor < ActiveRecord::Migration[6.0]
  def change
      add_column :vendors, :courier, :string
  end
end
