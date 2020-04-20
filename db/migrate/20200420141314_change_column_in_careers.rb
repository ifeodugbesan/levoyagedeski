class ChangeColumnInCareers < ActiveRecord::Migration[6.0]
  def change
    rename_column :careers, :type, :career_type
  end
end
