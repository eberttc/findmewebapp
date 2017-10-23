class CreateStorecategories < ActiveRecord::Migration
  def change
    create_table :storecategories do |t|
      t.references :store, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
