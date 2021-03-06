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

ActiveRecord::Schema.define(version: 20150711195914) do

  create_table "addresses", force: true do |t|
    t.integer  "event_id"
    t.string   "full_address"
    t.string   "city"
    t.string   "region"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_date_times", force: true do |t|
    t.integer  "event_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventaggs", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "site_type"
    t.string   "pagination"
    t.string   "domain"
    t.string   "eventpage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_json"
    t.integer  "pagination_type"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "description"
    t.string   "datetime"
    t.text     "price",       limit: 255
    t.string   "imagepath"
    t.text     "pdate",       limit: 255
    t.text     "ptime",       limit: 255
    t.text     "dump"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
  end

  create_table "precision_inputs", force: true do |t|
    t.integer  "session_id"
    t.integer  "event_id"
    t.string   "field_name"
    t.boolean  "is_correct"
    t.text     "how_wrong"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "statistic_id"
  end

  create_table "statistics", force: true do |t|
    t.integer  "total_events"
    t.integer  "num_addresses"
    t.integer  "num_pdate"
    t.integer  "num_ptime"
    t.integer  "num_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_sent"
  end

  create_table "xstuffs", force: true do |t|
    t.integer  "eventagg_id"
    t.string   "xpath"
    t.integer  "order"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
