class DashboardController < ApplicationController
	before_filter :authenticate_player!

	def index
		@question = { youtube_id: 'kt0g4dWxEBo', options: ["1", "2", "3"]}
	end

	def new
	end

	def edit
	end
end
