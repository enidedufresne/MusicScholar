class Player < ActiveRecord::Base
	has_many :responses
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
