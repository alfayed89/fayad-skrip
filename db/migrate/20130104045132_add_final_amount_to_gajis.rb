class AddFinalAmountToGajis < ActiveRecord::Migration
  def change
    add_column :gajis, :final_amount, :integer
  end
end
