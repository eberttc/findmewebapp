class ChangeInfoTypetInLostPets < ActiveRecord::Migration
 
  def self.up
    change_table :lost_pets do |t|
      t.change :info, :text
    end
  end

end
