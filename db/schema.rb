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

ActiveRecord::Schema.define(:version => 20121204165804) do

  create_table "billings", :force => true do |t|
    t.integer  "invoice_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "client_name"
    t.text     "notes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "clients", ["user_id"], :name => "index_clients_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "logo"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "payment_due"
    t.text     "address"
    t.decimal  "tax1"
    t.decimal  "tax2"
  end

  create_table "contacts", :force => true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "phone_work"
    t.string  "phone_cell"
    t.text    "notes"
    t.integer "client_id"
  end

  create_table "email_recipients", :force => true do |t|
    t.integer  "email_id"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "emails", :force => true do |t|
    t.integer  "invoice_id"
    t.text     "subject"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email_type"
  end

  create_table "invoices", :force => true do |t|
    t.string   "job_name"
    t.text     "notes"
    t.date     "service_date"
    t.integer  "client_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.decimal  "total"
    t.decimal  "tax1"
    t.decimal  "tax2"
    t.decimal  "subtotal"
    t.decimal  "total_tax1"
    t.decimal  "total_tax2"
    t.string   "po_number"
    t.date     "invoice_date"
    t.date     "due_date"
    t.decimal  "balance"
    t.decimal  "total_payments"
    t.integer  "payment_terms"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.decimal  "quantity"
    t.decimal  "cost_per"
    t.integer  "invoice_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.decimal  "total_cost"
    t.boolean  "tax1",       :default => false
    t.boolean  "tax2",       :default => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "invoice_id"
    t.date     "payment_date"
    t.decimal  "amount"
    t.text     "note"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
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
    t.text     "address"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
