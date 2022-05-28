# frozen_string_literal: true

class CreateTodoLists < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.boolean :completed

      t.timestamps
    end
  end
end
