class Provinsi < ActiveRecord::Base
  attr_accessible :nama
  has_many :kota
end
