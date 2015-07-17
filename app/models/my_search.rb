# == Schema Information
#
# Table name: my_searches
#
#  id          :integer          not null, primary key
#  lost_pet_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MySearch < ActiveRecord::Base
  belongs_to :lost_pet
  belongs_to :user
end
