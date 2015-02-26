class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def edit
		@questions = @artist.find_by_id params[:id]
	end

	def index
	end

	def artist_question
		@questions = @artist.questions
	end
end
