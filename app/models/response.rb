# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_id  :integer
#

class Response < ActiveRecord::Base
	belongs_to :player
	belongs_to :option
	belongs_to :question
end
