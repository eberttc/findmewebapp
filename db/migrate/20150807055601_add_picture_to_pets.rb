class AddPictureToPets < ActiveRecord::Migration
  def change
    add_column :pets, :picture, :text
  end
end
