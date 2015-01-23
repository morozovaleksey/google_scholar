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

ActiveRecord::Schema.define(version: 20150123154738) do

  create_table "queries", force: true do |t|
    t.string   "id_query"
    t.text     "query"
    t.integer  "number_relevant"
    t.integer  "number_all"
    t.integer  "number_page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "science_areas", force: true do |t|
    t.string   "science_area_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "science_subjects", force: true do |t|
    t.integer  "science_areas_id"
    t.string   "science_subject_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "science_subjects", ["science_areas_id"], name: "index_science_subjects_on_science_areas_id"

  create_table "science_terms", force: true do |t|
    t.integer  "science_subjects_id"
    t.string   "term_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "science_terms", ["science_subjects_id"], name: "index_science_terms_on_science_subjects_id"

  create_table "subject_areas", force: true do |t|
    t.string   "subject_area_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
