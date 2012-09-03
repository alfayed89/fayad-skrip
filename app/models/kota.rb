class Kota < ActiveRecord::Base
  self.table_name = 'kota'
  attr_accessible :nama, :provinsi_id
  belongs_to :provinsi
end
