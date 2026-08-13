class RenameDepartmentToThDepartmentOnUsers < ActiveRecord::Migration[8.1]
  def change
    rename_column :users, :department, :th_department
  end
end
