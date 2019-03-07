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

ActiveRecord::Schema.define(version: 20190307034834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "cep"
    t.string "state"
    t.string "city"
    t.string "district"
    t.string "street"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agencies", force: :cascade do |t|
    t.integer "number"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_agencies_on_address_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "token"
    t.string "cpf", null: false
    t.string "login", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_clients_on_address_id"
  end

  create_table "employee_relatings", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "address_id"
    t.bigint "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_employee_relatings_on_address_id"
    t.index ["employee_id"], name: "index_employee_relatings_on_employee_id"
    t.index ["office_id"], name: "index_employee_relatings_on_office_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "login", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["login"], name: "index_employees_on_login", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "office_relatings", force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_office_relatings_on_office_id"
    t.index ["route_id"], name: "index_office_relatings_on_route_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices_rules", id: false, force: :cascade do |t|
    t.bigint "office_id", null: false
    t.bigint "rule_id", null: false
  end

  create_table "operations", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.string "method"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.boolean "status"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_rules_on_route_id"
  end

  add_foreign_key "agencies", "addresses"
  add_foreign_key "clients", "addresses"
  add_foreign_key "employee_relatings", "addresses"
  add_foreign_key "employee_relatings", "employees"
  add_foreign_key "employee_relatings", "offices"
  add_foreign_key "office_relatings", "offices"
  add_foreign_key "office_relatings", "routes"
  add_foreign_key "rules", "routes"
end
