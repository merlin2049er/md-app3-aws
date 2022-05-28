# frozen_string_literal: true

class AddUncomfirmedEmailToDevise < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
  end
end
