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

ActiveRecord::Schema.define(:version => 20120903163434) do

  create_table "absens", :force => true do |t|
    t.integer  "karyawan_id"
    t.string   "status"
    t.text     "reason"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

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
    t.integer  "provinsi"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
