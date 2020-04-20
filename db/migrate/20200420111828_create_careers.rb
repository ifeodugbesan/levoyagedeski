class CreateCareers < ActiveRecord::Migration[6.0]
  def change
    create_table :careers do |t|
      t.string :type
      t.string :title
      t.text :description
      t.string :salary
      t.string :location
      t.string :contract
      t.string :link

      t.timestamps
    end
  end
end
