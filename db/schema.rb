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

ActiveRecord::Schema.define(version: 2018_06_29_220912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "desc"
    t.string "actions"
    t.integer "hp"
    t.integer "ac"
    t.integer "speed"
    t.integer "str"
    t.integer "dex"
    t.integer "con"
    t.integer "int"
    t.integer "wis"
    t.integer "cha"
    t.string "saving_throws"
    t.string "skills"
    t.string "senses"
    t.string "languages"
    t.string "abilities"
    t.integer "challenge"
    t.integer "cur_hp"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "user_id"
  end

  create_table "templates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "desc"
    t.string "actions"
    t.string "hp_s"
    t.string "ac_s"
    t.string "speed"
    t.string "str_s"
    t.string "dex_s"
    t.string "con_s"
    t.string "int_s"
    t.string "wis_s"
    t.string "cha_s"
    t.string "saving_throws"
    t.string "skills"
    t.string "senses"
    t.string "languages"
    t.string "abilities"
    t.integer "challenge"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "templates_users", id: false, force: :cascade do |t|
    t.bigint "template_id", null: false
    t.bigint "user_id", null: false
    t.index ["template_id"], name: "index_templates_users_on_template_id"
    t.index ["user_id"], name: "index_templates_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
