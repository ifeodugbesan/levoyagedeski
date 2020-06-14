class ChangeCityIdColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :city_id, false
  end
end
