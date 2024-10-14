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

ActiveRecord::Schema[7.2].define(version: 2024_10_02_070714) do
  create_table "m_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "category_name", limit: 50, null: false
    t.datetime "create_date", null: false
    t.datetime "modify_date", null: false
    t.integer "flg_visible", default: 1, null: false
    t.integer "flg_delete", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_moment_images", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "moment_id", null: false
    t.bigint "user_id", null: false
    t.string "path", null: false
    t.integer "flg_delete", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["moment_id"], name: "index_m_moment_images_on_moment_id"
    t.index ["user_id"], name: "index_m_moment_images_on_user_id"
  end

  create_table "m_moments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "title"
    t.text "comment"
    t.string "visit_user_name", limit: 50, null: false
    t.integer "flg_visible", default: 1, null: false
    t.integer "flg_delete", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_m_moments_on_category_id"
  end

  create_table "m_seos", primary_key: "path", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.text "keywords", null: false
    t.text "header_text", null: false
    t.text "footer_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_user_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "user_type_name", null: false
    t.datetime "create_date", null: false
    t.datetime "modify_date", null: false
    t.integer "flg_delete", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "m_user_type_id", null: false
    t.string "user_name", limit: 50, null: false
    t.string "nick_name", limit: 50, null: false
    t.string "user_set_id", limit: 50, null: false
    t.string "user_set_password", limit: 50, null: false
    t.string "user_set_image"
    t.string "email", null: false
    t.string "phone_number", limit: 20
    t.datetime "create_date", null: false
    t.datetime "modify_date", null: false
    t.integer "flg_delete", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["m_user_type_id"], name: "index_m_users_on_m_user_type_id"
  end

  add_foreign_key "m_moment_images", "m_moments", column: "moment_id"
  add_foreign_key "m_moment_images", "m_users", column: "user_id"
  add_foreign_key "m_moments", "m_categories", column: "category_id"
  add_foreign_key "m_users", "m_user_types"
end
