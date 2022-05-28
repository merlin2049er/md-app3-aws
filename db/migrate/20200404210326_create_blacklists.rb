# frozen_string_literal: true

class CreateBlacklists < ActiveRecord::Migration[6.0]
  def change
    create_table :blacklists do |t|
      t.string :email
      t.string :comment

      t.timestamps
    end
  end
end
