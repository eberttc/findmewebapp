class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :sex
      t.integer :age
      t.string :vaccinated
      t.text :information
      t.string :state
      t.references :pet_type, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :race, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
