class RenameTglLahirOnKaryawans < ActiveRecord::Migration
  def change
    change_column :karyawans , :tanggal_lahir , :date
  end
end
