class CreatePollOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_options do |t|
      t.string :poll
      t.string :item
      t.boolean :enabled
      t.boolean :poll_url_enabled
      t.string :poll_url
      t.integer :count

      t.timestamps
    end
  end
end
