class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :name
      t.text :description
      t.boolean :enabled

      t.timestamps
    end
  end
end
