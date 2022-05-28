class CreateSearchFors < ActiveRecord::Migration[6.0]
  def change
    create_table :search_fors do |t|
      t.string :searchterm

      t.timestamps
    end
  end
end
