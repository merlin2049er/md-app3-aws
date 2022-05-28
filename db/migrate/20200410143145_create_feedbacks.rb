# frozen_string_literal: true

class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :rate
      t.integer :recommned
      t.string :comment
      t.integer :category_id

      t.timestamps
    end
  end
end
