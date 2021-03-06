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

ActiveRecord::Schema.define(version: 20130801201835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grips", force: true do |t|
    t.string  "name",            null: false
    t.integer "sub_position_id"
  end

  create_table "instructional_videos", force: true do |t|
    t.string  "url"
    t.string  "title"
    t.text    "description"
    t.integer "major_category_id"
    t.integer "grip_id"
    t.string  "uploader"
  end

  create_table "major_categories", force: true do |t|
    t.string "name"
  end

  create_table "positions", force: true do |t|
    t.string  "name", null: false
    t.boolean "top"
  end

  create_table "s3_multipart_uploads", force: true do |t|
    t.string   "location"
    t.string   "upload_id"
    t.string   "key"
    t.string   "name"
    t.string   "uploader"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_positions", force: true do |t|
    t.string  "name",        null: false
    t.integer "position_id", null: false
  end

  create_table "users", force: true do |t|
    t.string "username",             null: false
    t.string "password_digest"
    t.string "email",                null: false
    t.string "password_reset_token"
    t.string "first_name"
    t.string "last_name"
    t.string "rank"
    t.string "gym"
    t.text   "about"
    t.string "location"
  end

end
