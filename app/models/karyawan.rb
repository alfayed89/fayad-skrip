class Karyawan < ActiveRecord::Base
  attr_accessible :agama, :alamat, :jabatan_id, :kelamin, :kota_id, :nama_lengkap, :nik, :npwp, :provinsi_id, :tangal_lahir, :tempat_lahir
end
