class AddKaryawanIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :karyawan_id, :integer
  end
end
