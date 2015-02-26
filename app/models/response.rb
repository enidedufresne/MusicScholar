class Response < ActiveRecord::Base
	belongs_to :player
	belongs_to :option
end
