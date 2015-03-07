# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  rss_url     :string
#

class Artist < ActiveRecord::Base
	belongs_to :category
	has_many :questions
	has_many :facts
end
