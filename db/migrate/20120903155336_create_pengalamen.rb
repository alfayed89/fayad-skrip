class CreatePengalamen < ActiveRecord::Migration
  def change
    create_table :pengalamen do |t|
      t.string :campany
      t.string :job_title
      t.text :job_desc
      t.timestamp :from
      t.timestamp :to
      t.text :reason

      t.timestamps
    end
  end
end
