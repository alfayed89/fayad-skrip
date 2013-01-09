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
  attr_accessible :tanggal_lahir, :tempat_lahir, :gaji_pokok, :roles
  
  belongs_to :jabatan
  has_many :absens
  has_many :holidays
  has_many :pendidikans
  has_many :pengalamen
  has_many :holydays  
  belongs_to :city
  has_one :admin_user
  
  attr_accessible :login
  attr_accessor :login
  
  def holydays_taken_in_year
    holydays.where(:approved_at => (Time.now.beginning_of_year)..(Time.now.end_of_year), :approved => true).sum(:day_duration)
  end
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
  
  def is?(role)
    roles.include?(role.to_s)
  end
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
  def role
    roles.first
  end
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
     if login = conditions.delete(:login)
       where(conditions).where(["lower(nik) = :value OR lower(email) = :value", { :value => login.downcase }]).first
     else
       where(conditions).first
     end
  end
  
  def have_absen_for_today?
    absens.where(:absen_for => Time.now.to_date).last != nil
  end
end
