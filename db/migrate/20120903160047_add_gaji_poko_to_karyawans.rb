class AddGajiPokoToKaryawans < ActiveRecord::Migration
  def change
    add_column :karyawans, :gaji_pokok, :integer
  end
end
