class CreatePendidikans < ActiveRecord::Migration
  def change
    create_table :pendidikans do |t|
      t.integer :karyawan_id
      t.string :grade
      t.string :institusi
      t.string :jurusan
      t.timestamp :from
      t.timestamp :to

      t.timestamps
    end
  end
end
