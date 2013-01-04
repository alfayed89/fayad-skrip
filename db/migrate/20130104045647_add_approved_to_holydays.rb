class AddApprovedToHolydays < ActiveRecord::Migration
  def change
    add_column :holydays, :approved, :boolean
  end
end
