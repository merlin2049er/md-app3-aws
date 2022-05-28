class CreateVoteds < ActiveRecord::Migration[6.0]
  def change
    create_table :voteds do |t|
      t.integer :user_id
      t.integer :poll_id

      t.timestamps
    end
  end
end
