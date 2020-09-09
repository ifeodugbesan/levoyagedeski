class ChangeColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :batch_id, true
  end
end
