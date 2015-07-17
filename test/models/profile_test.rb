# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  lastname    :string(255)
#  address     :string(255)
#  sex         :string(255)
#  user_id     :integer
#  district_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
