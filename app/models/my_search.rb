class MySearch < ActiveRecord::Base
  belongs_to :lost_pet
  belongs_to :user
end