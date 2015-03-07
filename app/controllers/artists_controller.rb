class ArtistsController < ApplicationController
	before_filter :authenticate_player!
	
	def new
		@artist = Artist.new
	end

	def index
		@artist = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
		@question = @artist.questions.where.not(id: params[:last_question]).order('id asc').take
	end

	def create
  	end

	def participant
	end

	# post '/responses' => 'artists#create_response', as: :response
	def create_response
		@response = Response.create(player_id: current_player.id, option_id: params[:option])
		@question = @response.option.question
		@total_questions = @question.artist.questions.count
		@answered = params[:correct].to_i
		if (@response.option.correct) && (@answered < @total_questions) 
			@answered += 1
			redirect_to category_artist_path(last_question: @question.id, correct: @answered,
			category_id: @question.artist.category.id, id: @question.artist.id)
		elsif @response.option.correct
			redirect_to category_path(@question.artist.category)
		else
			artist = @response.option.question.artist
			redirect_to category_path(artist.category), notice: "Sorry try again!"
		end
	end

	def edit
	end

	def ask_question
		# @artist = @question.artist.category
	end
end
