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

ActiveRecord::Schema.define(:version => 20121115092308) do

  create_table "absens", :force => true do |t|
    t.integer  "karyawan_id"
    t.string   "status"
    t.text     "reason"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "banks", :force => true do |t|
    t.string   "nama"
    t.string   "account_number"
    t.string   "account_nama"
    t.string   "cabang"
    t.integer  "karyawan_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "divisis", :force => true do |t|
    t.string   "nama"
    t.text     "keterangan"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gajis", :force => true do |t|
    t.integer  "karyawan_id"
    t.integer  "bonus"
    t.integer  "pajak"
    t.integer  "jamsostek"
    t.string   "other_value"
    t.string   "other_desc"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "holydays", :force => true do |t|
    t.integer  "karyawan_id"
    t.datetime "from"
    t.datetime "to"
    t.integer  "subsitution_id"
    t.text     "emergency_addres"
    t.string   "emergency_phone"
    t.text     "keterangan"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "jabatans", :force => true do |t|
    t.string   "nama"
    t.integer  "divisi_id"
    t.integer  "holyday_quota"
    t.text     "keterangan"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "karyawans", :force => true do |t|
    t.string   "nama_lengkap"
    t.string   "nik"
    t.string   "tempat_lahir"
    t.datetime "tanggal_lahir"
    t.string   "alamat"
    t.integer  "kota_id"
    t.integer  "provinsi_id"
    t.string   "kelamin"
    t.string   "agama"
    t.string   "npwp"
    t.integer  "jabatan_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "gaji_pokok"
  end

  create_table "kota", :force => true do |t|
    t.string   "nama"
    t.integer  "provinsi_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pendidikans", :force => true do |t|
    t.integer  "karyawan_id"
    t.string   "grade"
    t.string   "institusi"
    t.string   "jurusan"
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pengalamen", :force => true do |t|
    t.string   "campany"
    t.string   "job_title"
    t.text     "job_desc"
    t.datetime "from"
    t.datetime "to"
    t.text     "reason"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "provinsis", :force => true do |t|
    t.string   "nama"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nama"
    t.string   "role_type"
    t.string   "user_name"
    t.string   "password"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "karyawan_id"
  end

end
