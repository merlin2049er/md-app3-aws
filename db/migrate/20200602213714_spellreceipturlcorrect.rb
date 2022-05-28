# frozen_string_literal: true

class Spellreceipturlcorrect < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :reciept_url, :receipt_url
  end
end
