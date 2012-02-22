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

ActiveRecord::Schema.define(:version => 20120221131348) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "condition_fields", :force => true do |t|
    t.string   "namefield"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "typefield"
    t.integer  "typesubject_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phonehome"
    t.string   "phonemobile"
    t.string   "email"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "potentials",         :default => false
    t.integer  "type_customer_id"
    t.integer  "social_status_id"
    t.string   "permalink"
    t.integer  "typetransaction_id"
    t.datetime "lastcall"
  end

  add_index "customers", ["firstname", "lastname"], :name => "index_rcustomers_on_firstname_and_lastname"

  create_table "districts", :force => true do |t|
    t.integer  "city_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "districts", ["title"], :name => "index_districts_on_title"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "social_statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subjects", :force => true do |t|
    t.integer  "typesubject_id"
    t.integer  "city_id"
    t.integer  "price"
    t.integer  "area"
    t.string   "address"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "typetransaction_id"
    t.integer  "customer_id"
    t.integer  "district_id"
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "deadline"
    t.boolean  "done"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "typesubjects", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "floor"
  end

  create_table "typetransactions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "value_fields", :force => true do |t|
    t.string   "valuefield"
    t.integer  "condition_field_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
