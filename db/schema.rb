# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_17_185215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "citizens", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "cnpj"
    t.string "address"
    t.string "phone"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_citizens_on_user_id"
  end

  create_table "demands", force: :cascade do |t|
    t.string "description"
    t.integer "status", default: 0
    t.bigint "kind_id"
    t.bigint "user_id"
    t.datetime "done_at"
    t.string "protocol"
    t.string "address"
    t.string "neighborhood"
    t.string "block"
    t.string "lot"
    t.string "allotment"
    t.string "subunit"
    t.bigint "current_kind_step_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kind_id"], name: "index_demands_on_kind_id"
    t.index ["user_id"], name: "index_demands_on_user_id"
  end

  create_table "kind_step_users", force: :cascade do |t|
    t.bigint "kind_step_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kind_step_id"], name: "index_kind_step_users_on_kind_step_id"
    t.index ["user_id"], name: "index_kind_step_users_on_user_id"
  end

  create_table "kind_steps", force: :cascade do |t|
    t.string "name"
    t.boolean "valid_time", default: true
    t.bigint "kind_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kind_id"], name: "index_kind_steps_on_kind_id"
    t.index ["user_id"], name: "index_kind_steps_on_user_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.string "nature"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_kinds_on_user_id"
  end

  create_table "owners", force: :cascade do |t|
    t.bigint "citizen_id", null: false
    t.bigint "demand_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["citizen_id"], name: "index_owners_on_citizen_id"
    t.index ["demand_id"], name: "index_owners_on_demand_id"
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "kind_step_id", null: false
    t.bigint "demand_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["demand_id"], name: "index_steps_on_demand_id"
    t.index ["kind_step_id"], name: "index_steps_on_kind_step_id"
    t.index ["user_id"], name: "index_steps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "citizens", "users"
  add_foreign_key "demands", "kinds"
  add_foreign_key "demands", "users"
  add_foreign_key "kind_step_users", "kind_steps"
  add_foreign_key "kind_step_users", "users"
  add_foreign_key "kind_steps", "kinds"
  add_foreign_key "kind_steps", "users"
  add_foreign_key "kinds", "users"
  add_foreign_key "owners", "citizens"
  add_foreign_key "owners", "demands"
  add_foreign_key "owners", "users"
  add_foreign_key "steps", "demands"
  add_foreign_key "steps", "kind_steps"
  add_foreign_key "steps", "users"
end
