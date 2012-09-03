class CreateDivisis < ActiveRecord::Migration
  def change
    create_table :divisis do |t|
      t.string :nama
      t.text :keterangan

      t.timestamps
    end
  end
end
