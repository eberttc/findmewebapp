class AddStateToMySearches < ActiveRecord::Migration
  def change
    add_column :my_searches, :state, :integer
  end
end
