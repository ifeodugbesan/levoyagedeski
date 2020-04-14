class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :category
      t.string :title
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
