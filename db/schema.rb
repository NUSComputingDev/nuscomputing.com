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

ActiveRecord::Schema.define(version: 20160105112715) do

  create_table "enquiries", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "img"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "featured"
    t.string   "externalpage"
  end

  create_table "mc_members", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.integer  "wingid"
    t.integer  "wingrank"
    t.integer  "cellrank"
    t.string   "course"
    t.integer  "year"
    t.text     "description"
    t.string   "casualimg"
    t.string   "formalimg"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mc_wings", force: :cascade do |t|
    t.integer  "wingid"
    t.string   "wingname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.string   "img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

end
