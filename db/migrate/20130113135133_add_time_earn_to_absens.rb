class AddTimeEarnToAbsens < ActiveRecord::Migration
  def change
    remove_column :absens, :time_earn if column_exists? :absens, :time_earn 
    add_column :absens, :time_earn, :float
  end
end
