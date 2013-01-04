class Ability
  include CanCan::Ability
  def initialize(user)
    instance_user(user)
    extract_roles
  end

  def instance_user(user)
    @user = user ||= AdminUser.new
    # can :manage , :all , :email => 'admin@example.com'
  end
  
  def user
    @user
  end
  
  def extract_roles
    @user.roles.each { |role| send(role) }
  end
  def manager_personalia
    
    employe
    can :manage , Holyday
    can :manage , AdminUser , :id => user.id
  end
  
  def admintrator_SDM  
    can :manage , :all
  end
  def employe
    can :manage,  Karyawan , :karyawan_id => user.id
    can :create , Holyday , :karyawan_id => user.id
  end
  

end
