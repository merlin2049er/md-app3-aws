# frozen_string_literal: true

class RenameRecommnedInFeedback < ActiveRecord::Migration[6.0]
  def change
    rename_column :feedbacks, :recommned, :recommend
  end
end
