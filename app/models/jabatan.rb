class Jabatan < ActiveRecord::Base
  attr_accessible :divisi_id, :holyday_quota, :keterangan, :nama
  has_many :karyawans
  belongs_to :divisi
  def name
    nama
  end
end
