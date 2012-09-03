class CreateJabatans < ActiveRecord::Migration
  def change
    create_table :jabatans do |t|
      t.string :nama
      t.integer :divisi_id
      t.integer :holyday_quota
      t.text :keterangan

      t.timestamps
    end
  end
end
