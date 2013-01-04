class DbRevisionForToday < ActiveRecord::Migration
  def up
    change_column :holydays , :from , :date 
    change_column :holydays , :to , :date 
    
    change_column :pengalamen , :from , :date 
    change_column :pengalamen , :to , :date 

    add_column :pengalamen , :karyawan_id,  :integer

    change_column :pendidikans , :from , :date 
    change_column :pendidikans , :to , :date 
    
    add_column :absens, :absen_for, :date
    
    rename_column :pengalamen, :campany, :company
    rename_column :holydays, :emergency_addres, :emergency_address
  end

  def down
    rename_column :holydays, :emergency_address, :emergency_addres
    rename_column :pengalamen, :company, :campany
    remove_column :absens, :absen_for
    remove_column :pengalamen, :karyawan_id
  end
end
