class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.datetime :date
      t.string :payment_method
      t.string :status
      t.decimal :total, precision: 12, scale: 3

      t.timestamps null: false
    end
  end
end
