class AddForeignKeyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :batch, null: false, foreign_key: true
  end
end
