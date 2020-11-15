class RenameTypeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :type, :riding_style
  end
end
