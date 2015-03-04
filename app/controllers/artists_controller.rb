class ArtistsController < ApplicationController
	def new
		@artist = Artist.new
	end

	def index
		@artist = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
		@question = @artist.questions.where.not(id: params[:last_question]).order('random() asc').take
	end

	def create
  	end

	def participant
	end

	# post '/responses' => 'artists#create_response', as: :response
	def create_response
		@response = Response.create(player_id: current_player.id, option_id: params[:option])
		@question = @response.option.question
		if @response.option.correct
			redirect_to category_artist_path(last_question: @question.id,
			category_id: @question.artist.category.id, id: @question.artist.id)
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
