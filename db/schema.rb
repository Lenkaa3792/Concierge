# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_16_193634) do
  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "preferred_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "service_id", null: false
    t.date "order_date"
    t.string "status"
    t.decimal "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["service_id"], name: "index_orders_on_service_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id", null: false
    t.decimal "amount"
    t.date "payment_date"
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "services"
  add_foreign_key "payments", "orders"
end
