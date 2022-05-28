# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_msg
      t.integer :user_id
      t.boolean :shipped
      t.string :invoice_number
      t.string :tracking_number
      t.string :postal_carrier

      t.timestamps
    end
  end
end
