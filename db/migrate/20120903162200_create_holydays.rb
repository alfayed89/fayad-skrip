class CreateHolydays < ActiveRecord::Migration
  def change
    create_table :holydays do |t|
      t.integer :karyawan_id
      t.timestamp :from
      t.timestamp :to
      t.integer :subsitution_id
      t.text :emergency_addres
      t.string :emergency_phone
      t.text :keterangan

      t.timestamps
    end
  end
end
