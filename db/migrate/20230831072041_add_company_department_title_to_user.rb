class AddCompanyDepartmentTitleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :company, :string
    add_column :users, :department, :string
    add_column :users, :title, :string
    add_column :users, :mobile, :string
  end
end
