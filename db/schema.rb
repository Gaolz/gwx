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

ActiveRecord::Schema.define(version: 20170305063236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "description",                         null: false
    t.decimal  "price",       precision: 6, scale: 2, null: false
    t.datetime "created_at",                          null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade, comment: "博客表" do |t|
    t.string   "title",         limit: 30, default: "我的日志", null: false, comment: "标题"
    t.text     "content",                                                comment: "内容"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "url_title",                                              comment: "日志地址名"
    t.integer  "visited_count",            default: 0,      null: false, comment: "日志浏览量"
    t.index ["url_title"], name: "index_posts_on_url_title", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "post_id",                 comment: "日志ID"
    t.integer  "tag_id",                  comment: "标签ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_taggings_on_post_id", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade, comment: "博客标签表" do |t|
    t.string   "name",                    comment: "标签名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "pinyin"
    t.datetime "birthday"
    t.boolean  "gender"
    t.string   "icon"
    t.string   "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "taggings", "posts"
  add_foreign_key "taggings", "tags"
end
