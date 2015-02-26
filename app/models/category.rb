class Category < ActiveRecord::Base
	has_many :artists
	has_many :questions, through: :artist
	has_many :facts, through: :artist
end
