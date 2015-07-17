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

require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
