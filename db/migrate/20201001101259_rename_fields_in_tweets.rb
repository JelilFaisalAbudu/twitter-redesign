class RenameFieldsInTweets < ActiveRecord::Migration[6.0]
  def up
    rename_column :tweets, :Text, :text
    rename_column :tweets, :Author_id, :author_id
  end

  def def down
    rename_column :tweets, :text, :Text
  end
end
