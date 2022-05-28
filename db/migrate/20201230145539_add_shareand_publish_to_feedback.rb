class AddShareandPublishToFeedback < ActiveRecord::Migration[6.0]
  def change
    add_column :feedbacks, :share, :boolean
    add_column :feedbacks, :publish, :boolean
    
  end
end
