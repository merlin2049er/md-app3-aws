# frozen_string_literal: true

class AddCateoryIdToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :category_id, :integer
  end
end
