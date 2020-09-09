class RemoveBatchesFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :batch, null: false, foreign_key: true
  end
end
