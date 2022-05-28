# frozen_string_literal: true

class ChangeMessageTypetoText < ActiveRecord::Migration[6.0]
  def up
    change_column :troubletickets, :message, :text
  end

  def down
    change_column :troubletickets, :message, :string
  end
end
