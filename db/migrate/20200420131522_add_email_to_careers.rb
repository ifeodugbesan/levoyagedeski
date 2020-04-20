class AddEmailToCareers < ActiveRecord::Migration[6.0]
  def change
    add_column :careers, :email, :string
  end
end
