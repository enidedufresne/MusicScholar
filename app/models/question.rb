class Question < ActiveRecord::Base
	belongs_to :artist
	belongs_to :category
	validates :category, presence: true
end
