# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170117052627) do

  create_table "bigmains", force: :cascade do |t|
    t.string   "title"
    t.string   "pic1"
    t.string   "pic2"
    t.string   "pic3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cata_attachments", force: :cascade do |t|
    t.integer  "catalog_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catalogs", force: :cascade do |t|
    t.string   "name"
    t.string   "front_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "title_c"
    t.string   "content"
    t.string   "content_C"
    t.string   "event_pic"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.string   "title_c"
    t.string   "content"
    t.string   "content_c"
    t.string   "news_pic"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "notes"
    t.string   "content"
    t.text     "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_attachments", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "avatar"
    t.integer  "id_of_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qnas", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "email"
    t.string   "phone"
    t.string   "name"
    t.string   "qna_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smallmains", force: :cascade do |t|
    t.string   "title"
    t.string   "pic1"
    t.string   "pic2"
    t.string   "pic3"
    t.string   "pic4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "name_c"
    t.string   "address"
    t.string   "address_c"
    t.string   "phone"
    t.string   "photo"
    t.string   "weekday"
    t.string   "weekend"
    t.string   "holiday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
