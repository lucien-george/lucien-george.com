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

ActiveRecord::Schema.define(version: 2021_04_03_181047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commits", force: :cascade do |t|
    t.bigint "contributor_id"
    t.bigint "repo_id", null: false
    t.text "message"
    t.string "sha"
    t.string "url"
    t.string "html_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "pushed_at"
    t.index ["contributor_id"], name: "index_commits_on_contributor_id"
    t.index ["repo_id"], name: "index_commits_on_repo_id"
  end

  create_table "contributors", force: :cascade do |t|
    t.string "login"
    t.string "avatar_url"
    t.string "profile_url"
    t.string "followers_url"
    t.string "following_url"
    t.string "starred_url"
    t.integer "gh_id"
    t.string "gh_type"
    t.string "api_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color"
  end

  create_table "repo_contributors", force: :cascade do |t|
    t.bigint "repo_id", null: false
    t.bigint "contributor_id", null: false
    t.integer "contribution_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contributor_id"], name: "index_repo_contributors_on_contributor_id"
    t.index ["repo_id"], name: "index_repo_contributors_on_repo_id"
  end

  create_table "repo_languages", force: :cascade do |t|
    t.bigint "language_id", null: false
    t.bigint "repo_id", null: false
    t.integer "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_repo_languages_on_language_id"
    t.index ["repo_id"], name: "index_repo_languages_on_repo_id"
  end

  create_table "repos", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.boolean "private"
    t.jsonb "owner"
    t.string "html_url"
    t.string "api_url"
    t.boolean "fork"
    t.datetime "pushed_at"
    t.string "git_url"
    t.string "homepage"
    t.integer "size"
    t.integer "stars"
    t.integer "forks"
    t.integer "open_issues"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gh_id"
    t.integer "commits_count"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "commits", "contributors"
  add_foreign_key "commits", "repos"
  add_foreign_key "repo_contributors", "contributors"
  add_foreign_key "repo_contributors", "repos"
  add_foreign_key "repo_languages", "languages"
  add_foreign_key "repo_languages", "repos"
end
