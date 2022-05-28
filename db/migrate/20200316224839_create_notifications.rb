# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :notify_msg
      t.boolean :enabled
      t.integer :user_id

      t.timestamps
    end
  end
end
