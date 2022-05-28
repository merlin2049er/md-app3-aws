# frozen_string_literal: true

class AddIndexToConfirmationToken < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :confirmation_token
  end
end
