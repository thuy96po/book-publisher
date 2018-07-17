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

ActiveRecord::Schema.define(version: 20180716084637) do

  create_table "address_bills", force: :cascade do |t|
    t.string "address"
    t.string "phone"
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_address_bills_on_user_id"
  end

  create_table "advertisments", force: :cascade do |t|
    t.string "image"
    t.string "url"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill_details", force: :cascade do |t|
    t.integer "bill_id"
    t.integer "book_id"
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_details_on_bill_id"
    t.index ["book_id"], name: "index_bill_details_on_book_id"
    t.index ["created_at", "bill_id"], name: "index_bill_details_on_created_at_and_bill_id"
  end

  create_table "bills", force: :cascade do |t|
    t.integer "address_bill_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_bill_id"], name: "index_bills_on_address_bill_id"
  end

  create_table "book_discounts", force: :cascade do |t|
    t.integer "book_id"
    t.float "discount"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "start_date", "end_date"], name: "index_book_discounts_on_book_id_and_start_date_and_end_date"
    t.index ["book_id"], name: "index_book_discounts_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "price"
    t.text "description"
    t.integer "quantity"
    t.float "average_rate"
    t.integer "author_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "category_id", "price"], name: "index_books_on_author_id_and_category_id_and_price"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.float "rate"
    t.integer "book_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_comments_on_book_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "avatar"
    t.integer "role"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.datetime "activated_at"
    t.string "activated"
    t.string "boolean"
    t.string "reset_digest"
    t.datetime "reset_send_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
