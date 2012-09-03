class RenameTangalLahirToTanggalLahirFromKaryawan < ActiveRecord::Migration
  def change
    rename_column :karyawans, :tangal_lahir, :tanggal_lahir
  end

end
