class AddFieldsToProjectMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :project_members, :reason, :text
    add_column :project_members, :status, :string
  end
end
