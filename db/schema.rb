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

ActiveRecord::Schema.define(:version => 20150110073019) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "group_id"
    t.integer  "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permissions", :force => true do |t|
    t.integer  "permissible_id"
    t.string   "permissible_type"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "ability"
    t.boolean  "asserted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["permissible_id", "permissible_type"], :name => "index_permissions_permissible"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",           :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.integer  "customer_id"
    t.integer  "group_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "description"
  end

  create_table "users_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
