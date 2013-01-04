class Jabatan < ActiveRecord::Base
  attr_accessible :divisi_id, :holyday_quota, :keterangan, :nama
  has_many :karyawans
  def name
    nama
  end
end
