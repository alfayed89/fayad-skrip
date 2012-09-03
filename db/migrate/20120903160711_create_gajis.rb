class CreateGajis < ActiveRecord::Migration
  def change
    create_table :gajis do |t|
      t.integer :karyawan_id
      t.integer :bonus
      t.integer :pajak
      t.integer :jamsostek
      t.string :other_value
      t.string :other_desc

      t.timestamps
    end
  end
end
