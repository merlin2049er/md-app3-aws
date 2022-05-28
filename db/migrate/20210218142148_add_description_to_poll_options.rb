class AddDescriptionToPollOptions < ActiveRecord::Migration[6.0]
  def change
    add_column :poll_options, :description, :string
  end
end
