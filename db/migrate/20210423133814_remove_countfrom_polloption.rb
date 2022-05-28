class RemoveCountfromPolloption < ActiveRecord::Migration[6.0]
  def change
      remove_column :poll_options, :count
  end
end
