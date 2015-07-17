class CreateLostPets < ActiveRecord::Migration
  def change
    create_table :lost_pets do |t|
      t.string :status
      t.string :info
      t.date :report_date
      t.date :lost_date
      t.string :latitude
      t.string :longitude
      t.date :found_date
      t.references :pet, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
