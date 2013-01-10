class Pendidikan < ActiveRecord::Base
  attr_accessible :from, :grade, :institusi, :jurusan, :karyawan_id, :to
  belongs_to :karyawan
  validates :from , :grade , :institusi, :jurusan, :presence => true
  validate :range_to , :unless => "from.nil?"
  
  def range_to
    unless to.nil? 
      errors.add(:to, "harus lebih besar dari tahun masuk") if from > to
    end
  end
end
