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

ActiveRecord::Schema.define(:version => 20120126041448) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phonehome"
    t.string   "phonemobile"
    t.string   "email"
    t.text     "note"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "real",             :default => false
    t.integer  "type_customer_id"
    t.integer  "social_status_id"
  end

  add_index "customers", ["firstname", "lastname"], :name => "index_rcustomers_on_firstname_and_lastname"

  create_table "social_statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "typesubject"
    t.string   "cityname"
    t.string   "township"
    t.string   "address"
    t.integer  "price"
    t.integer  "numbofrooms"
    t.float    "square"
    t.float    "kitchensquare"
    t.float    "livingsquare"
    t.integer  "floor"
    t.string   "typestructure"
    t.integer  "yearofconstruction"
    t.string   "telephone"
    t.string   "furniture"
    t.string   "internet"
    t.string   "balcony"
    t.string   "wc"
    t.string   "layout"
    t.string   "state"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "subjects", ["numbofrooms"], :name => "index_subjects_on_numbofrooms"
  add_index "subjects", ["price"], :name => "index_subjects_on_price"
  add_index "subjects", ["square"], :name => "index_subjects_on_square"

  create_table "type_customers", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.date     "birth_date"
    t.string   "adress"
    t.string   "phone"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
