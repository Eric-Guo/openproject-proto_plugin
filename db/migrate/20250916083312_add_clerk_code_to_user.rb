class AddClerkCodeToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :clerk_code, :string
  end
end