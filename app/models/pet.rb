# == Schema Information
#
# Table name: pets
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  sex         :string(255)
#  age         :integer
#  vaccinated  :string(255)
#  information :text(65535)
#  state       :string(255)
#  pet_type_id :integer
#  user_id     :integer
#  race_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Pet < ActiveRecord::Base
  belongs_to :pet_type
  belongs_to :user
  belongs_to :race
end
