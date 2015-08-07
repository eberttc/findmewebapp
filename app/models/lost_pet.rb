# == Schema Information
#
# Table name: lost_pets
#
#  id          :integer          not null, primary key
#  status      :string(255)
#  info        :text(65535)
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
  has_many :comments
  #scope :distrito, ->(id) {where ('district_id = ?', id)}
  scope :by_distrito ,lambda{ |district_id| where(district_id: district_id)}
  scope :by_tipo, lambda { |pet_type_id|
    joins(:pet).where(["pets.pet_type_id = ?", pet_type_id])
  }
  
  #accepts_nested_attributes_for :pet
end
