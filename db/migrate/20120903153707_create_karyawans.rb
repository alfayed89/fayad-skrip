class CreateKaryawans < ActiveRecord::Migration
  def change
    create_table :karyawans do |t|
      t.string :nama_lengkap
      t.string :nik
      t.string :tempat_lahir
      t.timestamp :tangal_lahir
      t.string :alamat
      t.integer :kota_id
      t.integer :provinsi_id
      t.string :kelamin
      t.string :agama
      t.string :npwp
      t.integer :jabatan_id

      t.timestamps
    end
  end
end
