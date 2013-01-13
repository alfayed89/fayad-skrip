class Absen < ActiveRecord::Base
  attr_accessible :karyawan_id, :reason, :status, :absen_for, :onduty, :offduty
  belongs_to :karyawan
  validates :karyawan_id, :uniqueness => { :scope => :absen_for,
  :message => "Satu kali per hari" }
  before_create :assign_onduty
  
  def assign_onduty
    write_attribute(:onduty, Time.now)
  end
  def work_off
    write_attribute(:offduty, Time.now)
    write_attribute(:time_earn, (Time.now - onduty).to_f)
    save
    self
  end
  def real_time_earn
    read_attribute(:time_earn)
  end
  def time_earn
    (offduty.nil? ?  (Time.now - onduty) : read_attribute(:time_earn) ) 
    # return  (Time.now - onduty)
  end
end
