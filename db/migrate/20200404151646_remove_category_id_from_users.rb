# frozen_string_literal: true

class RemoveCategoryIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :category_id
  end
end
