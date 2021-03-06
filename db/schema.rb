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

ActiveRecord::Schema.define(:version => 20130218061901) do

  create_table "movie_sessions", :force => true do |t|
    t.string   "movie_edition"
    t.float    "price"
    t.datetime "screening_date"
    t.integer  "movie_id"
    t.integer  "movie_theatre_id"
    t.integer  "screening_room_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "seat_status"
  end

  create_table "movie_theatres", :force => true do |t|
    t.string   "name"
    t.string   "city",       :limit => 10
    t.string   "area",       :limit => 32
    t.string   "address"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.text     "director"
    t.text     "cast"
    t.text     "movie_type"
    t.text     "pubdate"
    t.text     "country"
    t.text     "language"
    t.integer  "movie_duration"
    t.text     "movie_edition"
    t.text     "rating"
    t.text     "summary"
    t.string   "douban_id",      :limit => 32
    t.boolean  "is_screening",                 :default => false
  end

  create_table "screening_rooms", :force => true do |t|
    t.string   "name"
    t.text     "seats"
    t.string   "order"
    t.integer  "movie_session_id"
    t.integer  "movie_theatre_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "session_orders", :force => true do |t|
    t.string   "order_id"
    t.integer  "movie_session_id"
    t.text     "choosed_seats"
    t.decimal  "expense",          :precision => 10, :scale => 0
    t.string   "status"
    t.string   "mobile"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

end
