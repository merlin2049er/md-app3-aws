class AddBelongsToPolloptions < ActiveRecord::Migration[6.0]
  def change

      change_table :poll_options do |t|
        t.belongs_to :poll
      end
  end
end
