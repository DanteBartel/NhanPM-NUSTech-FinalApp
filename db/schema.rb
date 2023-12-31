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

ActiveRecord::Schema[7.0].define(version: 2023_07_21_015007) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "album_pictures", force: :cascade do |t|
    t.text "picture", null: false
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.boolean "is_public", default: true
    t.integer "no_picture", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "like_albums_count"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "like_albums", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "album_id", null: false
  end

  create_table "like_photos", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "photo_id", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.boolean "is_public", default: true
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "like_photos_count"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email", null: false
    t.datetime "last_log_in"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.integer "photos_count"
    t.integer "albums_count"
    t.integer "followees_count"
    t.integer "followers_count"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "album_pictures", "albums"
  add_foreign_key "albums", "users"
  add_foreign_key "follows", "users", column: "followee_id"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "like_albums", "albums"
  add_foreign_key "like_albums", "users"
  add_foreign_key "like_photos", "photos"
  add_foreign_key "like_photos", "users"
  add_foreign_key "photos", "users"
end
