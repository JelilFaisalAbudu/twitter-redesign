# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_926_072_022) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'followings', force: :cascade do |t|
    t.bigint 'Follower_id', null: false
    t.bigint 'Followed_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['Followed_id'], name: 'index_followings_on_Followed_id'
    t.index ['Follower_id'], name: 'index_followings_on_Follower_id'
  end

  create_table 'tweets', force: :cascade do |t|
    t.text 'Text'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'Author_id', null: false
    t.index ['Author_id'], name: 'index_tweets_on_Author_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'Username'
    t.string 'FullName'
    t.string 'Photo'
    t.string 'CoverImage'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'followings', 'users', column: 'Followed_id'
  add_foreign_key 'followings', 'users', column: 'Follower_id'
  add_foreign_key 'tweets', 'users', column: 'Author_id'
end
