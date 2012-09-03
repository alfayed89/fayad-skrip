class RenameProvisiToProvinsiIdOnKotas < ActiveRecord::Migration
  def change
    rename_column :kota, :provinsi, :provinsi_id
  end
end
