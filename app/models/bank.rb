class Bank < ActiveRecord::Base
  attr_accessible :account_nama, :account_number, :cabang, :karyawan_id, :nama
end
