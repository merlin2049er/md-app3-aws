class AddIndexestoWatchlist < ActiveRecord::Migration[6.0]
  def change
    add_index  :watchlists, [:user_id, :product_id], unique: true
  end
end
