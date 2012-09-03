class Divisi < ActiveRecord::Base
  attr_accessible :keterangan, :nama
  has_many :jabatans
end
