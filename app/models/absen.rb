class Absen < ActiveRecord::Base
  attr_accessible :karyawan_id, :reason, :status, :absen_for
  belongs_to :karyawan
  validates :karyawan_id, :uniqueness => { :scope => :absen_for,
      :message => "Satu kali per hari" }
end
