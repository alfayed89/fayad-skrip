class AddRoleToKaryawans < ActiveRecord::Migration
  def change
    add_column :karyawans, :role, :string
  end
end
