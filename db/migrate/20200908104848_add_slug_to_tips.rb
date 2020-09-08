class AddSlugToTips < ActiveRecord::Migration[6.0]
  def change
    add_column :tips, :slug, :string
    add_index :tips, :slug, unique: true
  end
end
