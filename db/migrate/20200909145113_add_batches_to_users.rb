class AddBatchesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :batch, null: true, foreign_key: true
  end
end
