# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#  text       :string
#

class Question < ActiveRecord::Base
	belongs_to :artist
	belongs_to :category 
end
