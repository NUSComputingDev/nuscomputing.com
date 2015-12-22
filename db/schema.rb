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

ActiveRecord::Schema.define(version: 20151222083111) do

  create_table "enquiries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "contact",    limit: 255
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "img",         limit: 255
    t.string   "link",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.integer  "wingid",     limit: 4
    t.string   "wingname",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
