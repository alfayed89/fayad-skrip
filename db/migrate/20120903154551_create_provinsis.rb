class CreateProvinsis < ActiveRecord::Migration
  def change
    create_table :provinsis do |t|
      t.string :nama

      t.timestamps
    end
  end
end
