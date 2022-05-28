# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :message
      t.boolean :registered_user
      t.boolean :supplier

      t.timestamps
    end
  end
end
