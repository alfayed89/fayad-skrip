class AddPhotoUrlToKaryawans < ActiveRecord::Migration
  def change
    add_column :karyawans, :photo_url, :string, :limit => 500
  end
end
