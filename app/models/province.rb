class Province < ActiveRecord::Base
  attr_accessible :nama
  has_many :cites
  def name
    nama
  end
end
