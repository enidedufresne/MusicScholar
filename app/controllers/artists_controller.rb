class ArtistsController < ApplicationController
	def new
		@artist = Artist.new
	end

	def index
		@artist = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
		@question = @artist.questions.first
	end

	 def create
  	end

  def participant
  end

	def edit
	end

	def ask_question
		@artist = @question.artist.category
	end
end
