# frozen_string_literal: true

class RemoveCategoryIdFromCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :category_id
  end
end
