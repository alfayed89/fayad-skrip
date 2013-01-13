class ChangeApprovedAtToHolydaysPt2 < ActiveRecord::Migration
  change_column :holydays, :approved , :boolean , :default => false
end
