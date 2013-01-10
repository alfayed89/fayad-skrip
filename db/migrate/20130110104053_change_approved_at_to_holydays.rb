class ChangeApprovedAtToHolydays < ActiveRecord::Migration
  def change
    change_column :holydays, :approved , :boolean , :default => true
  end
end
