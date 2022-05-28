class Addfieldstoannoucements < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :announcement, :string
    add_column :announcements,  :enabled,     :boolean 
  end
end
