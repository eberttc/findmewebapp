class RemovePictureToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :picture, :text
  end
end
