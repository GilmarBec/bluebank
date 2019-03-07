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

ActiveRecord::Schema.define(version: 20190307174356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "number", null: false
    t.float "current_amount", default: 0.0
    t.float "credit", default: 0.0
    t.string "password_digest", null: false
    t.bigint "account_type_id"
    t.bigint "agency_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_type_id"], name: "index_accounts_on_account_type_id"
    t.index ["agency_id"], name: "index_accounts_on_agency_id"
    t.index ["client_id"], name: "index_accounts_on_client_id"
  end

  create_table "accounts_moviments", id: false, force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "moviment_id", null: false
  end

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

  create_table "employee_relations", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "address_id"
    t.bigint "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_employee_relations_on_address_id"
    t.index ["employee_id"], name: "index_employee_relations_on_employee_id"
    t.index ["office_id"], name: "index_employee_relations_on_office_id"
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

  create_table "moviments", force: :cascade do |t|
    t.float "value", default: 0.0
    t.datetime "operation_date"
    t.bigint "operation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operation_id"], name: "index_moviments_on_operation_id"
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

  add_foreign_key "accounts", "account_types"
  add_foreign_key "accounts", "agencies"
  add_foreign_key "accounts", "clients"
  add_foreign_key "agencies", "addresses"
  add_foreign_key "clients", "addresses"
  add_foreign_key "employee_relatings", "addresses"
  add_foreign_key "employee_relatings", "employees"
  add_foreign_key "employee_relatings", "offices"
  add_foreign_key "employee_relations", "addresses"
  add_foreign_key "employee_relations", "employees"
  add_foreign_key "employee_relations", "offices"
  add_foreign_key "moviments", "operations"
  add_foreign_key "rules", "routes"
end
