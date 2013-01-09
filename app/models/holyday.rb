class Holyday < ActiveRecord::Base
  attr_accessible :emergency_address, :emergency_phone, :from, :karyawan_id, :keterangan, :subsitution_id, :to
  belongs_to :karyawan
  validates :karyawan_id, :from, :to, :emergency_phone, :emergency_address, :presence => true 
  validate :check_quota , :unless => "from.nil?"
  has_one :subsitution , :class_name => 'Karyawan' , :foreign_key => 'subsitution_id'
  
  scope :approved_in_year , -> { where(:approved_at => (Time.now.beginning_of_year)..(Time.now.end_of_year), :approved => true) }
  def check_quota
    if  to <= from
      errors.add(:to, "Harus lebih dari tanggal mulai")
      return
    end
    errors.add(:to, "pilihan anda melebihi quota yang ditentukan") if (karyawan.holydays_taken_in_year + (to.to_date - from.to_date).to_i) > karyawan.jabatan.holyday_quota
  end
  
  
end
