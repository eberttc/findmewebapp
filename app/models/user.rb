# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  username        :string(255)
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
   #      :recoverable, :rememberable, :trackable, :validatable
    
   before_save {self.email =email.downcase}    
   validates :username, presence: true, length:{minimum: 3,maximun: 40} , uniqueness: {case_sensitive: true}
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, uniqueness: {case_sensitive: true} ,length: {maximum: 105},format: {with: VALID_EMAIL_REGEX}
   validates :password, confirmation: :true          
         has_many :pets
         has_many :lost_pets
         has_many :my_searches
         has_one :profiles
         has_secure_password
        
end
