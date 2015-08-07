# == Schema Information
#
# Table name: my_searches
#
#  id          :integer          not null, primary key
#  lost_pet_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  state       :integer
#

require 'test_helper'

class MySearchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
