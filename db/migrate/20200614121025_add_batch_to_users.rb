class AddBatchToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :batch, foreign_key: true
  end
end
