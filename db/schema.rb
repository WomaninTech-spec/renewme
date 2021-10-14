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

ActiveRecord::Schema.define(version: 2021_10_14_192120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "followings_articles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_followings_articles_on_article_id"
    t.index ["user_id"], name: "index_followings_articles_on_user_id"
  end

  create_table "followings_users", force: :cascade do |t|
    t.bigint "followee_id"
    t.bigint "follower_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followee_id"], name: "index_followings_users_on_followee_id"
    t.index ["follower_id"], name: "index_followings_users_on_follower_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "visible", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs_applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_jobs_applications_on_job_id"
    t.index ["user_id"], name: "index_jobs_applications_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "recommandations", force: :cascade do |t|
    t.bigint "users_skill_id", null: false
    t.bigint "user_id", null: false
    t.integer "level"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_recommandations_on_user_id"
    t.index ["users_skill_id"], name: "index_recommandations_on_users_skill_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.boolean "visible", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_skills", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "skill_id", null: false
    t.integer "level"
    t.boolean "previous_skills"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_users_skills_on_skill_id"
    t.index ["user_id"], name: "index_users_skills_on_user_id"
  end

  add_foreign_key "articles", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "followings_articles", "articles"
  add_foreign_key "followings_articles", "users"
  add_foreign_key "followings_users", "users", column: "followee_id"
  add_foreign_key "followings_users", "users", column: "follower_id"
  add_foreign_key "jobs_applications", "jobs"
  add_foreign_key "jobs_applications", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "recommandations", "users"
  add_foreign_key "recommandations", "users_skills"
  add_foreign_key "users_skills", "skills"
  add_foreign_key "users_skills", "users"
end
