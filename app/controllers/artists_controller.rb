class ArtistsController < ApplicationController
	def new
		@artist = Artist.new
	end

	def index
		@artist = Artist.all
	end

	def edit
	end

	def ask_question
		@artist = @question.artist.category
	end
end
