class AddPictureToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :picture, :text
  end
end
