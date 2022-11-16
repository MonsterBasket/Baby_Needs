# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_02_054734) do
  create_table "comments", force: :cascade do |t|
    t.string "content", null: false
    t.integer "commented_on_id", null: false
    t.string "commented_on_type", null: false
    t.integer "user_id", null: false
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "liked_id", null: false
    t.string "liked_type", null: false
    t.string "category", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "lost_item_id", null: false
    t.string "name", null: false
    t.string "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lost_item_id"], name: "index_locations_on_lost_item_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "lost_items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.string "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lost_items_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.string "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_problems_on_user_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "problem_id", null: false
    t.string "description", null: false
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_solutions_on_problem_id"
    t.index ["user_id"], name: "index_solutions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "display_name"
    t.string "country"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "reputation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "locations", "lost_items"
  add_foreign_key "locations", "users"
  add_foreign_key "lost_items", "users"
  add_foreign_key "problems", "users"
  add_foreign_key "solutions", "problems"
  add_foreign_key "solutions", "users"
end
