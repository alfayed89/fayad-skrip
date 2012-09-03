class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nama
      t.string :role_type
      t.string :user_name
      t.string :password

      t.timestamps
    end
  end
end
