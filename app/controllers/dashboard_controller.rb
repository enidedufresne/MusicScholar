class DashboardController < ApplicationController
	before_filter :authenticate_player!

	def index
		# @question = Question.last
	end

	def new
		@question = Question.order("RANDOM()").first
	end

	def edit
	end


end
