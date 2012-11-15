class Karyawan < ActiveRecord::Base
  attr_accessible :agama, :alamat, :jabatan_id, :kelamin, :city_id, :nama_lengkap, :nik, :npwp, :tanggal_lahir, :tempat_lahir, :gaji_pokok
  belongs_to :jabatan
  has_many :absens
  has_many :holidays
  has_many :pendidikans
  has_many :pengalamans
  belongs_to :city
end
