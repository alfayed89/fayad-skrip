class AddUserIdToAdminUsers < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :karyawan_id, :integer
  end
  def self.down
  end
end
