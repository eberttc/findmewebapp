class RemoveAddressFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :address, :string
  end
end
