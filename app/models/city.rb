class City < ActiveRecord::Base
  attr_accessible :nama, :province_id
  belongs_to :province
end
