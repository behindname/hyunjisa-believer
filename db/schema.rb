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

ActiveRecord::Schema.define(version: 2021_03_21_073446) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "believers", force: :cascade do |t|
    t.integer "temple_id"
    t.string "name"
    t.integer "addressProvince"
    t.string "addressDetail"
    t.string "phone"
    t.integer "gender"
    t.date "birthday"
    t.date "registerday"
    t.text "remarks"
    t.string "ganzhi"
    t.string "dharmaName"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "profile"
    t.index ["temple_id"], name: "index_believers_on_temple_id"
  end

  create_table "buddhas", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offerings", force: :cascade do |t|
    t.integer "temple_id", null: false
    t.integer "buddha_id", null: false
    t.integer "believer_id", null: false
    t.string "donator"
    t.string "offerorRelation"
    t.string "offerorName"
    t.string "offerorBirthyear"
    t.string "offerorAddress"
    t.string "offerorPhone"
    t.date "offerDay"
    t.text "request"
    t.text "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["believer_id"], name: "index_offerings_on_believer_id"
    t.index ["buddha_id"], name: "index_offerings_on_buddha_id"
    t.index ["temple_id"], name: "index_offerings_on_temple_id"
  end

  create_table "pray_donations", force: :cascade do |t|
    t.integer "pray_id", null: false
    t.date "donateDay"
    t.integer "donation"
    t.string "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pray_id"], name: "index_pray_donations_on_pray_id"
  end

  create_table "pray_requests", force: :cascade do |t|
    t.integer "pray_id", null: false
    t.date "requestDay"
    t.text "request"
    t.string "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pray_id"], name: "index_pray_requests_on_pray_id"
  end

  create_table "prays", force: :cascade do |t|
    t.integer "temple_id", null: false
    t.integer "buddha_id", null: false
    t.integer "believer_id", null: false
    t.string "donator"
    t.string "prayerRelation"
    t.string "prayerName"
    t.string "prayerBirthyear"
    t.string "prayerAddress"
    t.string "prayerPhone"
    t.date "startDay"
    t.date "finishDay"
    t.date "fullPayDay"
    t.boolean "isPrayFinished"
    t.boolean "isFinishConfirmed"
    t.text "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["believer_id"], name: "index_prays_on_believer_id"
    t.index ["buddha_id"], name: "index_prays_on_buddha_id"
    t.index ["temple_id"], name: "index_prays_on_temple_id"
  end

  create_table "temples", force: :cascade do |t|
    t.string "place"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "temple_id"
    t.string "name"
    t.integer "addressProvince"
    t.string "addressDetail"
    t.string "phone"
    t.integer "gender"
    t.date "birthday"
    t.date "registerday"
    t.text "remarks"
    t.string "ganzhi"
    t.string "dharmaName"
    t.string "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["temple_id"], name: "index_users_on_temple_id"
  end

  add_foreign_key "believers", "temples"
  add_foreign_key "offerings", "believers"
  add_foreign_key "offerings", "buddhas"
  add_foreign_key "offerings", "temples"
  add_foreign_key "pray_donations", "prays"
  add_foreign_key "pray_requests", "prays"
  add_foreign_key "prays", "believers"
  add_foreign_key "prays", "buddhas"
  add_foreign_key "prays", "temples"
  add_foreign_key "users", "temples"
end
