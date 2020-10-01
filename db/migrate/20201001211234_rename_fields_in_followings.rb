class RenameFieldsInFollowings < ActiveRecord::Migration[6.0]
  def up
    rename_column :followings, :Follower_id, :follower_id
    rename_column :followings, :Followed_id, :followed_id
  end

  def down
    rename_column :followings, :follower_id, :Follower_id
    rename_column :followings, :followed_id, :Followed_id
  end
end
