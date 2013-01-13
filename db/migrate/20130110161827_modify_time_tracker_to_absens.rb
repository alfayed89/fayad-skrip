class ModifyTimeTrackerToAbsens < ActiveRecord::Migration
  def change
    change_column :absens , :onduty , :datetime
    change_column :absens , :offduty , :datetime
  end
end
