class Absen < ActiveRecord::Base
  attr_accessible :karyawan_id, :reason, :status
  belongs_to :karyawan
end
