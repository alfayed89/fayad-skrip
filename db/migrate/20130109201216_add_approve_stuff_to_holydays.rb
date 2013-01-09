class AddApproveStuffToHolydays < ActiveRecord::Migration
  def up
    change_column :holydays, :approved, :boolean, :default => true
    add_column :holydays, :approved_at, :date
    add_column :holydays, :day_duration, :integer
  end
  def down
    remove_column :holydays, :approved_at
    remove_column :holydays, :day_duration
  end
end
