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

ActiveRecord::Schema.define(version: 20150825143846) do

  create_table "admin_homes", force: :cascade do |t|
    t.string   "board_name"
    t.integer  "board_post"
    t.string   "board_title"
    t.string   "board_subtitle"
    t.integer  "max_length"
    t.integer  "level"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "boards", force: :cascade do |t|
    t.integer  "level_read"
    t.integer  "level_list"
    t.integer  "level_write"
    t.integer  "level_comment"
    t.integer  "level_delete"
    t.integer  "level_modify"
    t.integer  "level_admin"
    t.string   "title"
    t.string   "content"
    t.string   "flag"
    t.integer  "position1"
    t.integer  "position2"
    t.string   "board_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "board_id"
    t.integer  "comment_user_id"
    t.string   "comment_user_name"
    t.string   "comment_content"
    t.integer  "comment_vote"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "navbar_id"
    t.string   "ltype"
    t.string   "url"
    t.integer  "index"
    t.string   "icon"
    t.string   "title"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "myprj_eaches", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "myprj_each_img"
    t.string   "prj_title"
    t.string   "prj_memo"
    t.text     "prj_content"
    t.string   "prj_url"
    t.integer  "prj_ctgory"
    t.integer  "lookable"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "navbars", force: :cascade do |t|
    t.integer  "index"
    t.integer  "level"
    t.string   "title"
    t.string   "style_class"
    t.string   "ltype"
    t.string   "url"
    t.string   "icon"
    t.integer  "xs"
    t.integer  "sm"
    t.integer  "md"
    t.integer  "lg"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "post_user_id"
    t.string   "post_user_name"
    t.string   "post_user_univ"
    t.string   "post_user_team"
    t.string   "post_title"
    t.integer  "post_secret"
    t.text     "post_content"
    t.integer  "post_count",     default: 0, null: false
    t.integer  "post_vote",      default: 0, null: false
    t.integer  "post_comments",  default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "user_alarms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_involves", force: :cascade do |t|
    t.integer  "thing_id"
    t.string   "thing_type"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_msgs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "msg_content"
    t.integer  "from_user_id"
    t.integer  "msg_check"
    t.string   "msg_attachment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_email",    default: "", null: false
    t.string   "user_name",     default: "", null: false
    t.integer  "user_sex"
    t.string   "user_team"
    t.integer  "user_univ"
    t.integer  "user_icon"
    t.integer  "user_level"
    t.integer  "user_exp"
    t.string   "user_pic"
    t.boolean  "user_mailing"
    t.boolean  "user_open"
    t.integer  "user_gold"
    t.string   "user_phone"
    t.string   "user_password", default: "", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
