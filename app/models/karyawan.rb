class Karyawan < ActiveRecord::Base
  attr_accessible :agama, :alamat, :jabatan_id, :kelamin, :kota_id, :nama_lengkap, :nik, :npwp, :tanggal_lahir, :tempat_lahir, :gaji_pokok
  belongs_to :jabatan
  has_many :absens
  has_many :holidays
  has_many :pendidikans
  has_many :pengalamans
  belongs_to :kota, :class_name => 'Kota', :foreign_key => 'kota_id'
end
