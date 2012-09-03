class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :nama
      t.string :account_number
      t.string :account_nama
      t.string :cabang
      t.integer :karyawan_id

      t.timestamps
    end
  end
end
