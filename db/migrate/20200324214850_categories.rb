# frozen_string_literal: true

class Categories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :picurl

      t.timestamps
    end
  end
end
