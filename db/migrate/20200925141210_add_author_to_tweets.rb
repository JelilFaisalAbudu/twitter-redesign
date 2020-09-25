class AddAuthorToTweets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tweets, :Author, null: false, foreign_key: {to_table: :users}
  end
end
