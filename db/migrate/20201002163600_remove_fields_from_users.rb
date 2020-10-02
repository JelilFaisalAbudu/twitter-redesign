class RemoveFieldsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :Photo, :string
    remove_column :users, :CoverImage, :string
  end
end
