class CreateOrderdetails < ActiveRecord::Migration
  def change
    create_table :orderdetails do |t|
      t.integer :quantity
      t.decimal :price, precision: 12, scale: 3
      t.decimal :subtotal, precision: 12, scale: 3
      t.belongs_to :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
