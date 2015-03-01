# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#  category_id :integer
#

class Artist < ActiveRecord::Base
	belongs_to :category
	has_many :questions
	has_many :facts
end
