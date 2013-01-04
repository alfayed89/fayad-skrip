class Gaji < ActiveRecord::Base
  attr_accessible :bonus, :jamsostek, :karyawan_id, :other_desc, :other_value, :pajak, :final_amount
  belongs_to :karyawan
  validates :karyawan_id, :presence => true
  validate :monthly_validate, :on => :create, :unless => 'karyawan_id.nil?'
  before_save :assign_final_amount
  def monthly_validate
    errors.add(:karyawan_id, "gaji bulan #{Time.now.strftime('%B')} untuk #{karyawan.name} telah terdata") unless Gaji.where(:karyawan_id => self.karyawan_id, :created_at => (Time.now.beginning_of_month..Time.now.end_of_month)).last.nil? 
  end
  def assign_final_amount
    
  end
end
