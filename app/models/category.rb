# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Category < ActiveRecord::Base
	has_many :artists
	has_many :questions, through: :artist
	has_many :facts, through: :artist
end
