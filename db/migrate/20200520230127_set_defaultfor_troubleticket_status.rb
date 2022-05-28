# frozen_string_literal: true

class SetDefaultforTroubleticketStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :troubletickets, :status, :boolean, default: 'true'
  end
end
