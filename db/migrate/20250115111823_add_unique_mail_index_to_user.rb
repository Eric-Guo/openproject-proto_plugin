class AddUniqueMailIndexToUser < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :mail, unique: true, where: "mail IS NOT NULL AND mail <> ''"
  end
end
