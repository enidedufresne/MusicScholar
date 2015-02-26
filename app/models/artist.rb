class Artist < ActiveRecord::Base
	belongs_to :category
	has_many :questions
	has_many :facts
end
