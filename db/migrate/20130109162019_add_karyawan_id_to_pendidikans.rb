class AddKaryawanIdToPendidikans < ActiveRecord::Migration
  def change
    add_column :pendidikans, :karyawan_id, :integer
  end
end
