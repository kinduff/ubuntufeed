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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130322175220) do

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "url"
    t.string   "feed_url"
    t.text     "description"
    t.boolean  "visible",           :default => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "encuesta", :force => true do |t|
    t.integer  "puntuacion"
    t.text     "comentario"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "logs", :force => true do |t|
    t.integer  "log_type"
    t.integer  "new_posts"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "link"
    t.datetime "pubdate"
    t.text     "description"
    t.integer  "blog_id"
  end

  create_table "stats", :force => true do |t|
    t.integer "post_id"
    t.integer "clicks"
  end

end
