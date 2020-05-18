class AddTipTypeToTips < ActiveRecord::Migration[6.0]
  def change
    add_column :tips, :tip_type, :string
  end
end
