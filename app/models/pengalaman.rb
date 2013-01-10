class Pengalaman < ActiveRecord::Base
  attr_accessible :company, :from, :job_desc, :job_title, :reason, :to, :karyawan_id
  validates :company, :from, :job_desc, :job_title, :presence => true
  validate :check_to , :unless => "from.nil?"
  
  def check_to
    errors.add(:to , "Harus lebih setalah tanggal masuh") if to.nil? == false and from > to
  end
end
