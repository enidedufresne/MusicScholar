class DashboardController < ApplicationController
	before_filter :authenticate_player!

<<<<<<< HEAD
	def index	
	end

	def new
	end

	def edit
=======
	def index
		@question = { youtube_id: 'kt0g4dWxEBo', options: ["1", "2", "3"]}
>>>>>>> b1a3b8ff2e7f1165296eb2c48ef5eae951bd39c4
	end
end
