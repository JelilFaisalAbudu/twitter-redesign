class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :Follower, null: false, foreign_key: { to_table: :users }
      t.references :Followed, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
