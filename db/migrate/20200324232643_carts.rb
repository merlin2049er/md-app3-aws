# frozen_string_literal: true

class Carts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :product_id
      t.boolean :prodessing
      t.integer :qty
      t.boolean :paid

      t.timestamps
    end
  end
end
