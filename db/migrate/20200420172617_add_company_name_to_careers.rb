class AddCompanyNameToCareers < ActiveRecord::Migration[6.0]
  def change
    add_column :careers, :company_name, :string
  end
end
