class AddRevisionForKotaNamingConvention < ActiveRecord::Migration
  def up
    rename_table :kota , :cities
    rename_table :provinsis , :provinces
    rename_column :karyawans , :kota_id , :city_id
    rename_column :cities , :provinsi_id , :province_id
    
  end

  def down
    rename_column :cities , :province_id, :provinsi_id 
    rename_column :karyawans , :city_id ,:kota_id 
    rename_table :cities , :kota
    rename_table :provinces, :provinsis
    
  end
end
