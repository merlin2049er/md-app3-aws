# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :uri
      t.boolean :enabled
      t.integer :product_id

      t.timestamps
    end
  end
end
