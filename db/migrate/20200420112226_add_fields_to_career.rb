class AddFieldsToCareer < ActiveRecord::Migration[6.0]
  def change
    add_column :careers, :closed, :boolean, default: false
    add_reference :careers, :user, foreign_key: true
  end
end
