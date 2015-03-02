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

	# post '/responses' => 'artists#create_response', as: :response
	def create_response
		@response = Response.create(player_id: current_player.id, option_id: params[:option])
		if @response.option.correct
			redirect_to :back
		else
			artist = @response.option.question.artist
			redirect_to category_path(artist.category), :notice => "Sorry try again!"
		end
	end

	def edit
	end

	def ask_question
		@artist = @question.artist.category
	end
end
