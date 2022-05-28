# frozen_string_literal: true

class CreateTroubletickets < ActiveRecord::Migration[6.0]
  def change
    create_table :troubletickets do |t|
      t.integer :user_id
      t.boolean :status
      t.string :campaign
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
