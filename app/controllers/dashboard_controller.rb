class DashboardController < ApplicationController
	before_filter :authenticate_player!

	def index
		# @question = Question.last
		@question = Question.take
	end

	def new
		@question = Question.order("RANDOM()").first
	end

	def edit
	end


end
