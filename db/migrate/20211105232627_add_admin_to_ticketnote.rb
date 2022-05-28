class AddAdminToTicketnote < ActiveRecord::Migration[6.0]
  def change
    add_column :ticketnotes, :admin, :boolean
  end
end
