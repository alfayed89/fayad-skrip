class Karyawan < ActiveRecord::Base
  ROLES = ['super_admin', 'director', 'human_resource', 'employee']
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :agama, :alamat, :jabatan_id, :kelamin, :city_id, :nama_lengkap, :nik, :npwp
  attr_accessible :tanggal_lahir, :tempat_lahir, :gaji_pokok, :role
  
  belongs_to :jabatan
  has_many :absens
  has_many :holidays
  has_many :pendidikans
  has_many :pengalamans
  belongs_to :city
  has_one :admin_user
  
  def self.g_new(hash)
    new_k = self.new(hash)
    new_k.uniq_nik
    new_k
  end
  def uniq_nik
    while true do
      c_nik = "%010d" % rand(99999999)
      break if Karyawan.find_by_nik(c_nik).nil?
    end
    self.password = c_nik.to_s
    self.nik = c_nik.to_s 
  end
  
  def name
    nama_lengkap
  end
end
