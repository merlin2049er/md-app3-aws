class AddPolloptionIdToVoted < ActiveRecord::Migration[6.0]
  def change
      add_column :voteds, :polloption_id, :integer
  end
end
