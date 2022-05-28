# frozen_string_literal: true

class RenameCategoryIdInFeedback < ActiveRecord::Migration[6.0]
  def change
    rename_column :feedbacks, :category_id, :transaction_id
  end
end
