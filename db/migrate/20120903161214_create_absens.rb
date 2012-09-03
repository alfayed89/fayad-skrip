class CreateAbsens < ActiveRecord::Migration
  def change
    create_table :absens do |t|
      t.integer :karyawan_id
      t.string :status
      t.text :reason

      t.timestamps
    end
  end
end
