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

ActiveRecord::Schema.define(version: 20160531160726) do

  create_table "items", force: :cascade do |t|
    t.string  "name"
    t.integer "price"
    t.integer "receipt_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.string  "date"
    t.integer "user_id"
    t.integer "store_id"
    t.integer "number_of_items"
    t.integer "total"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
  end

end
