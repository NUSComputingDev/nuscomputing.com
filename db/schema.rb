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

ActiveRecord::Schema.define(version: 20160719085714) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "blast_emails", force: :cascade do |t|
    t.datetime "sent_at"
    t.string   "background_image_file_name",    limit: 255
    t.string   "background_image_content_type", limit: 255
    t.integer  "background_image_file_size",    limit: 4
    t.datetime "background_image_updated_at"
    t.string   "background_color",              limit: 255
    t.integer  "width",                         limit: 4
    t.integer  "height",                        limit: 4
    t.text     "items_position",                limit: 65535
    t.integer  "member_id",                     limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "blast_emails", ["member_id"], name: "index_blast_emails_on_member_id", using: :btree

  create_table "blast_items", force: :cascade do |t|
    t.integer  "image_ratio",      limit: 4
    t.integer  "text_ratio",       limit: 4
    t.integer  "blast_email_id",   limit: 4
    t.integer  "blast_request_id", limit: 4
    t.integer  "position_index",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "blast_items", ["blast_email_id"], name: "index_blast_items_on_blast_email_id", using: :btree
  add_index "blast_items", ["blast_request_id"], name: "index_blast_items_on_blast_request_id", using: :btree

  create_table "blast_requests", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.text     "text",               limit: 65535
    t.integer  "status",             limit: 4,     default: 0
    t.integer  "member_id",          limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "blast_requests", ["member_id"], name: "index_blast_requests_on_member_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "contact",    limit: 255
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "img",          limit: 255
    t.string   "link",         limit: 255
    t.text     "description",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "externalpage", limit: 255
    t.boolean  "featured"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.string   "email",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "item_requests", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "item_id",    limit: 4
    t.integer  "status",     limit: 4, default: 0
    t.integer  "member_id",  limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "item_requests", ["item_id"], name: "index_item_requests_on_item_id", using: :btree
  add_index "item_requests", ["member_id"], name: "index_item_requests_on_member_id", using: :btree
  add_index "item_requests", ["user_id"], name: "index_item_requests_on_user_id", using: :btree

  create_table "item_transactions", force: :cascade do |t|
    t.integer  "status",                   limit: 4,   default: 0
    t.datetime "pending_sent_at"
    t.datetime "pending_expire_at"
    t.datetime "transaction_began_at"
    t.datetime "transaction_end_at"
    t.datetime "transaction_completed_at"
    t.string   "token",                    limit: 255,             null: false
    t.integer  "item_request_id",          limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "qrcode_file_name",         limit: 255
    t.string   "qrcode_content_type",      limit: 255
    t.integer  "qrcode_file_size",         limit: 4
    t.datetime "qrcode_updated_at"
  end

  add_index "item_transactions", ["item_request_id"], name: "index_item_transactions_on_item_request_id", using: :btree
  add_index "item_transactions", ["token"], name: "index_item_transactions_on_token", using: :btree

  create_table "item_types", force: :cascade do |t|
    t.string   "name",               limit: 255,   null: false
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.string   "label",              limit: 255
    t.integer  "status",             limit: 4,   default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "item_type_id",       limit: 4
    t.integer  "state",              limit: 4,   default: 0
  end

  add_index "items", ["item_type_id"], name: "index_items_on_item_type_id", using: :btree

  create_table "locker_allocations", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "locker_id",       limit: 4
    t.integer  "locker_round_id", limit: 4
    t.integer  "status",          limit: 4, default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "locker_allocations", ["locker_id"], name: "index_locker_allocations_on_locker_id", using: :btree
  add_index "locker_allocations", ["locker_round_id"], name: "index_locker_allocations_on_locker_round_id", using: :btree
  add_index "locker_allocations", ["user_id"], name: "index_locker_allocations_on_user_id", using: :btree

  create_table "locker_ballots", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "locker_round_id", limit: 4
    t.string   "location",        limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "locker_ballots", ["locker_round_id"], name: "index_locker_ballots_on_locker_round_id", using: :btree
  add_index "locker_ballots", ["user_id"], name: "index_locker_ballots_on_user_id", using: :btree

  create_table "locker_rounds", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string   "acad_year",  limit: 255
    t.string   "label",      limit: 255
    t.integer  "kind",       limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "allocated",              default: false
  end

  create_table "lockers", force: :cascade do |t|
    t.integer  "location",   limit: 4,   default: 0
    t.string   "number",     limit: 255
    t.integer  "status",     limit: 4,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "mc_members", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "position",    limit: 255
    t.integer  "wingid",      limit: 4
    t.integer  "wingrank",    limit: 4
    t.integer  "cellrank",    limit: 4
    t.string   "course",      limit: 255
    t.integer  "year",        limit: 4
    t.text     "description", limit: 65535
    t.string   "casualimg",   limit: 255
    t.string   "formalimg",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "mc_wings", force: :cascade do |t|
    t.integer  "wingid",       limit: 4
    t.string   "wingname",     limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "mc_member_id", limit: 4
  end

  add_index "mc_wings", ["mc_member_id"], name: "index_mc_wings_on_mc_member_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "email",               limit: 255, default: "",              null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,   default: 0,               null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "role_id",             limit: 4
    t.string   "provider",            limit: 255, default: "google_oauth2", null: false
    t.string   "uid",                 limit: 255, default: "",              null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["role_id"], name: "index_members_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "website",     limit: 255
    t.string   "img",         limit: 255
    t.text     "description", limit: 65535
    t.boolean  "featured"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",            limit: 255, default: "", null: false
    t.string   "uid",                 limit: 255, default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "faculty",             limit: 255
    t.string   "email",               limit: 255
    t.string   "name",                limit: 255
    t.string   "first_major",         limit: 255
    t.string   "second_major",        limit: 255
    t.string   "gender",              limit: 255
    t.string   "matriculation_year",  limit: 255
  end

  add_foreign_key "mc_wings", "mc_members"
end
