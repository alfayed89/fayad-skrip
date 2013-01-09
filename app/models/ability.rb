class Ability
  include CanCan::Ability
  def initialize(user)
    instance_user(user)
  end

  def instance_user(user)
    @user = user ||= Karyawan.new
    cannot :manage , :all
    @user.roles.reverse.each { |role| send(role.to_sym) if respond_to?(role.to_sym)}
  end
  def user
    @user
  end
  def super_admin
    # can :manage, :all
    can :manage, :all
    # cannot :create, Karyawan
  end
  def employee
    can :absent_for_today, Absen
    can [:index, :read, :create] , [Absen, Gaji, Pengalaman, Holyday, Pendidikan], :karyawan_id => user.id
    can :manage , Karyawan, :id => user.id
  end
  def human_resource
    employee
    can :read , Karyawan
    can :approve, Holyday
  end
  def director
    human_resource
    cannot :approve, Holyday
  end
  
end
