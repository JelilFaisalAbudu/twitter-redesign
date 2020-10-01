class RenameFieldsInUsers < ActiveRecord::Migration[6.0]
  def up
    rename_column :users, :Username, :username
    rename_column :users, :FullName, :full_name
  end

  def down
    rename_column :users, :username, :Username
    rename_column :users, :full_name, :FullName
  end

end
