class LostPet < ActiveRecord::Base
  belongs_to :pet
  belongs_to :user
  belongs_to :district
end
