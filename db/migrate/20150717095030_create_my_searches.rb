class CreateMySearches < ActiveRecord::Migration
  def change
    create_table :my_searches do |t|
      t.references :lost_pet, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
