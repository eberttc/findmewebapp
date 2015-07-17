# == Schema Information
#
# Table name: lost_pets
#
#  id          :integer          not null, primary key
#  status      :string(255)
#  info        :string(255)
#  report_date :date
#  lost_date   :date
#  latitude    :string(255)
#  longitude   :string(255)
#  found_date  :date
#  pet_id      :integer
#  user_id     :integer
#  district_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LostPet < ActiveRecord::Base
  belongs_to :pet
  belongs_to :user
  belongs_to :district
end
