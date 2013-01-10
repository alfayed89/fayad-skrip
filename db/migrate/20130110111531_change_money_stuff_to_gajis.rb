class ChangeMoneyStuffToGajis < ActiveRecord::Migration
  def change
    change_column :gajis, :bonus, :integer , :default => 0
    change_column :gajis, :pajak, :integer , :default => 0
    change_column :gajis, :jamsostek, :integer , :default => 0
    change_column :gajis, :final_amount, :integer , :default => 0
  end
end
