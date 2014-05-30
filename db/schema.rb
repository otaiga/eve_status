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

ActiveRecord::Schema.define(version: 20140518172031) do

  create_table "eve_alliances", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "alliance_id"
    t.integer  "executor_corp_id"
    t.integer  "member_count"
    t.datetime "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eve_member_corporations", force: true do |t|
    t.integer  "eve_alliance_id"
    t.integer  "corporation_id"
    t.datetime "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eve_required_attributes", force: true do |t|
    t.string   "primary_attribute"
    t.string   "secondary_attribute"
    t.integer  "eve_skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eve_required_skills", force: true do |t|
    t.integer  "type_id"
    t.integer  "skill_level"
    t.string   "name"
    t.integer  "eve_skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eve_skill_bonus_collections", force: true do |t|
    t.integer  "eve_skill_id"
    t.integer  "bonus_value"
    t.string   "bonus_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eve_skill_grps", force: true do |t|
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eve_skills", force: true do |t|
    t.integer  "eve_skill_grp_id"
    t.string   "type_name"
    t.integer  "group_id"
    t.integer  "type_id"
    t.text     "description"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
