# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#  text       :string
#  youtube_id :string
#

class Question < ActiveRecord::Base
	has_many :options :dependent => :destroy
	belongs_to :artist
	belongs_to :category
	has_many :responses, through: :options
end
