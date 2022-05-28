class RemoveItemFromPollOption < ActiveRecord::Migration[6.0]
  def change
     remove_column :poll_options, :item
  end
end
