class CreateKota < ActiveRecord::Migration
  def change
    create_table :kota do |t|
      t.string :nama
      t.integer :provinsi

      t.timestamps
    end
  end
end
