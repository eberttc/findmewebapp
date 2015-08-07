# == Schema Information
#
# Table name: pets
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  sex                :string(255)
#  age                :integer
#  vaccinated         :string(255)
#  information        :text(65535)
#  state              :string(255)
#  pet_type_id        :integer
#  user_id            :integer
#  race_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  picture            :text(65535)
#

class Pet < ActiveRecord::Base
  belongs_to :pet_type
  belongs_to :user
  belongs_to :race
  has_many :lost_pet
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
