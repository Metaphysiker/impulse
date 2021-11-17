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

ActiveRecord::Schema.define(version: 2021_11_17_113336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_messages", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "message_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_messages_on_account_id"
    t.index ["message_id"], name: "index_account_messages_on_message_id"
  end

  create_table "account_options", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "option_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_options_on_account_id"
    t.index ["option_id"], name: "index_account_options_on_option_id"
  end

  create_table "account_slides", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "slide_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_slides_on_account_id"
    t.index ["slide_id"], name: "index_account_slides_on_slide_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "current_slide", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "portrait_name", default: "portrait_frau.png"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "cv_units", force: :cascade do |t|
    t.string "category", default: ""
    t.string "name", default: ""
    t.text "content", default: ""
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "location", default: ""
    t.string "company", default: ""
    t.string "job", default: ""
    t.index ["user_id"], name: "index_cv_units_on_user_id"
  end

  create_table "cvs", force: :cascade do |t|
    t.string "name", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title", default: ""
    t.text "description", default: ""
    t.text "content", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "search_field"
    t.datetime "start_of_date"
    t.datetime "end_of_date"
    t.string "slug"
    t.string "location", default: ""
    t.string "hyperlink", default: ""
    t.decimal "latitude", default: "0.0"
    t.decimal "longitude", default: "0.0"
    t.string "feed_origin", default: ""
    t.string "published", default: "yes"
    t.index ["slug"], name: "index_events_on_slug", unique: true
  end

  create_table "expertises", force: :cascade do |t|
    t.string "title", default: ""
    t.text "description", default: ""
    t.text "content", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "category", default: "only_text"
    t.string "name", default: ""
    t.string "chatter", default: "vegan"
    t.text "content", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "target_message_id"
    t.integer "target_message_id_for_option"
    t.string "ancestry"
    t.string "starting_point", default: "no"
    t.string "video_url", default: ""
    t.integer "video_duration", default: 0
    t.integer "sleep_time", default: 2000
    t.string "dead_end_breaker", default: "no"
    t.integer "order", default: 5
    t.index ["ancestry"], name: "index_messages_on_ancestry"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "content", default: ""
    t.string "target_slide", default: ""
    t.bigint "slide_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "published"
    t.string "email", default: ""
    t.index ["slide_id"], name: "index_options_on_slide_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  create_table "participants", force: :cascade do |t|
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.string "email", default: ""
    t.string "status", default: "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "period_start"
    t.date "period_end"
  end

  create_table "post_tags", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "search_field"
    t.string "slug"
    t.string "author", default: ""
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "title", default: ""
    t.string "category", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "slides", force: :cascade do |t|
    t.string "name", default: ""
    t.text "content", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "show_suggestion", default: "yes"
    t.string "starting_slide", default: "no"
  end

  create_table "support_request_expertises", force: :cascade do |t|
    t.bigint "support_request_id"
    t.bigint "expertise_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expertise_id"], name: "index_support_request_expertises_on_expertise_id"
    t.index ["support_request_id"], name: "index_support_request_expertises_on_support_request_id"
  end

  create_table "support_request_users", force: :cascade do |t|
    t.bigint "support_request_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["support_request_id"], name: "index_support_request_users_on_support_request_id"
    t.index ["user_id"], name: "index_support_request_users_on_user_id"
  end

  create_table "support_requests", force: :cascade do |t|
    t.string "title", default: ""
    t.text "content", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_cvs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cv_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cv_id"], name: "index_user_cvs_on_cv_id"
    t.index ["user_id"], name: "index_user_cvs_on_user_id"
  end

  create_table "user_expertises", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "expertise_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expertise_id"], name: "index_user_expertises_on_expertise_id"
    t.index ["user_id"], name: "index_user_expertises_on_user_id"
  end

  create_table "user_messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "message_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id"], name: "index_user_messages_on_message_id"
    t.index ["user_id"], name: "index_user_messages_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: ""
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.string "location", default: ""
    t.string "plz", default: ""
    t.string "street", default: ""
    t.string "phone", default: ""
    t.date "birth_day"
    t.string "recruitment_consultant", default: ""
    t.date "disposal_period_start"
    t.date "disposal_period_end"
    t.string "personal_number", default: ""
    t.string "unemployment_insurance_number", default: ""
    t.string "job_title", default: ""
    t.string "website", default: ""
    t.text "short_description", default: ""
    t.string "nationality", default: ""
    t.string "marital_status", default: ""
    t.text "long_description", default: ""
    t.string "power_word1", default: ""
    t.string "power_word2", default: ""
    t.string "power_word3", default: ""
    t.string "quote", default: ""
    t.string "are_you_in_mentoring50", default: "no"
    t.text "motivation_letter_why_you", default: ""
    t.text "motivation_letter_why_me", default: ""
    t.text "motivation_letter_why_us", default: ""
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cv_units", "users"
  add_foreign_key "skills", "users"
end
