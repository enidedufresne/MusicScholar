# == Schema Information
#
# Table name: facts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fact < ActiveRecord::Base
	belongs_to :artist
end
