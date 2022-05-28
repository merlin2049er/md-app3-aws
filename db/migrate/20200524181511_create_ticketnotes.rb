# frozen_string_literal: true

class CreateTicketnotes < ActiveRecord::Migration[6.0]
  def change
    create_table :ticketnotes do |t|
      t.references :troubleticket, null: false, foreign_key: true
      t.string :notes

      t.timestamps
    end
  end
end
