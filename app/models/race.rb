# == Schema Information
#
# Table name: races
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Race < ActiveRecord::Base
   
end
