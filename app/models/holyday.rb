class Holyday < ActiveRecord::Base
  attr_accessible :emergency_addres, :emergency_phone, :from, :karyawan_id, :keterangan, :subsitution_id, :to
  belongs_to :karyawan
  has_one :subsitution , :class_name => 'Karyawan' , :foreign_key => 'subsitution_id'
end
