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

ActiveRecord::Schema.define(version: 20160630010108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_organisations", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "organisation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "job_organisations", ["job_id"], name: "index_job_organisations_on_job_id", using: :btree
  add_index "job_organisations", ["organisation_id"], name: "index_job_organisations_on_organisation_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "job_number"
    t.text     "description"
    t.integer  "state",       default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "title"
    t.string   "phone"
    t.integer  "organisation_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.string   "line_item_1"
    t.string   "line_item_2"
    t.string   "line_item_3"
    t.string   "line_item_4"
    t.string   "cost_4"
    t.string   "line_item_5"
    t.string   "cost_5"
    t.text     "notes"
    t.integer  "specification_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "printer_name"
    t.integer  "cost_1_cents"
    t.string   "cost_1_currency",  default: "AUD", null: false
    t.integer  "cost_2_cents"
    t.string   "cost_2_currency",  default: "AUD", null: false
    t.integer  "cost_3_cents"
    t.string   "cost_3_currency",  default: "AUD", null: false
  end

  add_index "quotes", ["specification_id"], name: "index_quotes_on_specification_id", using: :btree

  create_table "specifications", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "quote_due"
    t.string   "job_due"
    t.boolean  "proof_required"
    t.boolean  "press_check_required"
    t.text     "notes"
    t.integer  "job_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "specifications", ["job_id"], name: "index_specifications_on_job_id", using: :btree

  add_foreign_key "quotes", "specifications"
  add_foreign_key "specifications", "jobs"
end
